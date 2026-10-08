import IRDCS.Dual

namespace IRDCS
open Finset

theorem row_residue_mod (n m a : ℕ) : row n m (a % m) = row n m a := by
  simp [row]

/-- A three-hit full intersection necessarily has its modulus in the finite range. -/
theorem modulus_le_of_three_hits {n m a : ℕ}
    (hc : 3 ≤ (row n m a).card) : m ≤ n := by
  by_contra h
  have hnm : n < m := by omega
  have hcard : (row n m a).card ≤ 1 := by
    apply card_le_one.mpr
    intro x hx y hy
    obtain ⟨_, hxn, hxa⟩ := mem_row.mp hx
    obtain ⟨_, hyn, hya⟩ := mem_row.mp hy
    rw [Nat.mod_eq_of_lt (by omega)] at hxa hya
    exact hxa.trans hya.symm
  omega

/-- Exhaustive inequalities for one length, with exact integer weights.
The budget uses all m=2,...,n, assigning zero to absent certificate keys. -/
def FiniteValid (n : ℕ) (A D : ℕ → ℤ) : Prop :=
  (∀ m ∈ Icc 2 n, 0 ≤ D m) ∧
  (∀ m ∈ Icc 2 n, ∀ a ∈ range m,
    n ≤ 6 * m → 3 ≤ (row n m a).card →
      0 ≤ (∑ x ∈ row n m a, A x) + D m) ∧
  (∑ x ∈ Icc 1 n, A x) + ∑ m ∈ Icc 2 n, D m < 0

instance (n : ℕ) (A D : ℕ → ℤ) : Decidable (FiniteValid n A D) := by
  unfold FiniteValid
  infer_instance

/-- Certificate-checking soundness for every cover, without finite search over covers. -/
theorem finiteValid_excludes {n k : ℕ} (A D : ℕ → ℤ)
    (hcert : FiniteValid n A D) (C : TargetCover n k)
    (hmin : ∀ i, n ≤ 6 * C.modulus i) : False := by
  obtain ⟨hD, hrows, hnegative⟩ := hcert
  have hM : ∀ i, C.modulus i ∈ Icc 2 n := by
    intro i
    exact mem_Icc.mpr ⟨C.modulus_ge_two i, modulus_le_of_three_hits (C.three_hits i)⟩
  apply dual_excludes C A D (Icc 2 n) hM hD _ hnegative
  intro i
  have ha : C.residue i % C.modulus i ∈ range (C.modulus i) := by
    apply mem_range.mpr
    apply Nat.mod_lt
    have := C.modulus_ge_two i
    omega
  have hr := hrows (C.modulus i) (hM i) (C.residue i % C.modulus i) ha (hmin i)
  rw [row_residue_mod] at hr
  exact hr (C.three_hits i)

end IRDCS
