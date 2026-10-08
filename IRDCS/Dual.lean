import IRDCS.Basic

namespace IRDCS
open Finset

/-- Coverage preserves the sum of arbitrary signed point weights. -/
theorem sum_rows {n k : ℕ} (C : TargetCover n k) (A : ℕ → ℤ) :
    (∑ i, ∑ x ∈ row n (C.modulus i) (C.residue i), A x) =
      ∑ x ∈ Icc 1 n, A x := by
  simp only [row, sum_filter]
  rw [sum_comm]
  apply sum_congr rfl
  intro x hx
  obtain ⟨i, hi, huniq⟩ := C.partition x hx
  have hi' : x % C.modulus i = C.residue i % C.modulus i := (mem_row.mp hi).2.2
  rw [sum_eq_single i]
  · simp [hi']
  · intro j _ hji
    have hne : x % C.modulus j ≠ C.residue j % C.modulus j := by
      intro heq
      have hj : x ∈ row n (C.modulus j) (C.residue j) :=
        mem_row.mpr ⟨(mem_Icc.mp hx).1, (mem_Icc.mp hx).2, heq⟩
      exact hji (huniq j hj)
    simp [hne]
  · simp

/-- Soundness of signed point weights and nonnegative distinct-modulus budgets.
This is the mathematical reduction shared by both certificate families. -/
theorem dual_nonnegative {n k : ℕ} (C : TargetCover n k)
    (A D : ℕ → ℤ) (M : Finset ℕ)
    (hM : ∀ i, C.modulus i ∈ M)
    (hD : ∀ m ∈ M, 0 ≤ D m)
    (hrow : ∀ i, 0 ≤ (∑ x ∈ row n (C.modulus i) (C.residue i), A x)
      + D (C.modulus i)) :
    0 ≤ (∑ x ∈ Icc 1 n, A x) + ∑ m ∈ M, D m := by
  have hsum := sum_nonneg (fun i (_ : i ∈ (univ : Finset (Fin k))) => hrow i)
  rw [sum_add_distrib, sum_rows] at hsum
  have hsub : univ.image C.modulus ⊆ M := by
    intro m hm
    obtain ⟨i, _, rfl⟩ := mem_image.mp hm
    exact hM i
  have hbound : (∑ i, D (C.modulus i)) ≤ ∑ m ∈ M, D m := by
    rw [← sum_image (fun i _ j _ hij => C.distinct hij)]
    exact sum_le_sum_of_subset_of_nonneg hsub (fun m hm _ => hD m hm)
  omega

theorem dual_excludes {n k : ℕ} (C : TargetCover n k)
    (A D : ℕ → ℤ) (M : Finset ℕ)
    (hM : ∀ i, C.modulus i ∈ M)
    (hD : ∀ m ∈ M, 0 ≤ D m)
    (hrow : ∀ i, 0 ≤ (∑ x ∈ row n (C.modulus i) (C.residue i), A x)
      + D (C.modulus i))
    (hnegative : (∑ x ∈ Icc 1 n, A x) + ∑ m ∈ M, D m < 0) : False := by
  have := dual_nonnegative C A D M hM hD hrow
  omega

end IRDCS
