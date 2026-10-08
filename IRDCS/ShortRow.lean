import IRDCS.FiniteCertificate

namespace IRDCS
open Finset

def firstRep (m a : ℕ) : ℕ := if a % m = 0 then m else a % m
def shortRow (n m a : ℕ) : Finset ℕ :=
  ((range 6).image (fun j => firstRep m a + j * m)).filter (fun x => x ≤ n)

theorem firstRep_pos {m a : ℕ} (hm : 0 < m) : 0 < firstRep m a := by
  unfold firstRep
  split_ifs with h
  · exact hm
  · omega

/-- Under the forbidden-minimum assumption, enumerating six terms is complete. -/
theorem row_eq_shortRow {n m a : ℕ} (hm : 0 < m) (hn : n ≤ 6 * m) :
    row n m a = shortRow n m a := by
  ext x
  constructor
  · intro hx
    obtain ⟨hxpos, hxn, hxa⟩ := mem_row.mp hx
    apply mem_filter.mpr
    refine ⟨?_, hxn⟩
    have hdecomp := Nat.mod_add_div x m
    have hq : x / m ≤ 6 := by
      have hh : x / m ≤ (6 * m) / m := Nat.div_le_div_right (hxn.trans hn)
      simpa [Nat.mul_comm 6 m, Nat.mul_div_cancel_left _ hm] using hh
    unfold firstRep
    split_ifs with hzero
    · have hqpos : 0 < x / m := by rw [hxa, hzero] at hdecomp; nlinarith
      apply mem_image.mpr
      refine ⟨x / m - 1, mem_range.mpr (by omega), ?_⟩
      rw [hxa, hzero] at hdecomp
      have hh : x / m - 1 + 1 = x / m := by omega
      nlinarith
    · apply mem_image.mpr
      have hqstrict : x / m < 6 := by
        by_contra h
        have hh : x / m = 6 := Nat.le_antisymm hq (Nat.not_lt.mp h)
        rw [hxa, hh] at hdecomp
        omega
      refine ⟨x / m, mem_range.mpr hqstrict, ?_⟩
      rw [hxa] at hdecomp
      nlinarith
  · intro hx
    obtain ⟨hximage, hxn⟩ := mem_filter.mp hx
    obtain ⟨j, _, rfl⟩ := mem_image.mp hximage
    apply mem_row.mpr
    refine ⟨by have := firstRep_pos (a := a) hm; omega, hxn, ?_⟩
    unfold firstRep
    split_ifs with h
    · simp [Nat.add_mod, h]
    · simp [Nat.add_mod, Nat.mod_mod]

def FastFiniteValid (n : ℕ) (A D : ℕ → ℤ) : Prop :=
  (∀ m ∈ Icc 2 n, 0 ≤ D m) ∧
  (∀ m ∈ Icc 2 n, ∀ a ∈ range m,
    n ≤ 6 * m → 3 ≤ (shortRow n m a).card →
      0 ≤ (∑ x ∈ shortRow n m a, A x) + D m) ∧
  (∑ x ∈ Icc 1 n, A x) + ∑ m ∈ Icc 2 n, D m < 0

instance (n : ℕ) (A D : ℕ → ℤ) : Decidable (FastFiniteValid n A D) := by
  unfold FastFiniteValid
  infer_instance

theorem fastFiniteValid_sound {n : ℕ} {A D : ℕ → ℤ}
    (h : FastFiniteValid n A D) : FiniteValid n A D := by
  obtain ⟨hD, hrows, ht⟩ := h
  refine ⟨hD, ?_, ht⟩
  intro m hm a ha hn hc
  have hmpos : 0 < m := by have := (mem_Icc.mp hm).1; omega
  rw [row_eq_shortRow hmpos hn] at hc ⊢
  exact hrows m hm a ha hn hc

/-- Boolean outer enumeration avoids building a large dependent decision tree.
All comparisons and signed sums still reduce in the Lean kernel. -/
def finiteCheckBool (n : ℕ) (A D : ℕ → ℤ) : Bool :=
  (List.range (n + 1)).all (fun m =>
    if 2 ≤ m then decide (0 ≤ D m) && (List.range m).all (fun a =>
      decide (n ≤ 6 * m → 3 ≤ (shortRow n m a).card →
        0 ≤ (∑ x ∈ shortRow n m a, A x) + D m)) else true) &&
    decide ((∑ x ∈ Icc 1 n, A x) + ∑ m ∈ Icc 2 n, D m < 0)

theorem finiteCheckBool_sound {n : ℕ} {A D : ℕ → ℤ}
    (h : finiteCheckBool n A D = true) : FastFiniteValid n A D := by
  obtain ⟨hrows, ht⟩ := Bool.and_eq_true_iff.mp h
  have hrow (m : ℕ) (hm : m ∈ Icc 2 n) :=
    List.all_eq_true.mp hrows m (List.mem_range.mpr (by have := (mem_Icc.mp hm).2; omega))
  refine ⟨?_, ?_, of_decide_eq_true ht⟩
  · intro m hm
    have hh := hrow m hm
    rw [if_pos (mem_Icc.mp hm).1] at hh
    exact of_decide_eq_true (Bool.and_eq_true_iff.mp hh).1
  · intro m hm a ha
    have hh := hrow m hm
    rw [if_pos (mem_Icc.mp hm).1] at hh
    have hha := List.all_eq_true.mp (Bool.and_eq_true_iff.mp hh).2 a
      (List.mem_range.mpr (mem_range.mp ha))
    exact of_decide_eq_true hha

def modulusCheckBool (n : ℕ) (A D : ℕ → ℤ) (m : ℕ) : Bool :=
  decide (0 ≤ D m) && (List.range m).all (fun a =>
    decide (n ≤ 6 * m → 3 ≤ (shortRow n m a).card →
      0 ≤ (∑ x ∈ shortRow n m a, A x) + D m))

def ModulusValid (n : ℕ) (A D : ℕ → ℤ) (m : ℕ) : Prop :=
  0 ≤ D m ∧ ∀ a ∈ range m, n ≤ 6 * m → 3 ≤ (shortRow n m a).card →
    0 ≤ (∑ x ∈ shortRow n m a, A x) + D m

theorem modulusCheckBool_sound {n m : ℕ} {A D : ℕ → ℤ}
    (h : modulusCheckBool n A D m = true) : ModulusValid n A D m := by
  obtain ⟨hD, hrows⟩ := Bool.and_eq_true_iff.mp h
  refine ⟨of_decide_eq_true hD, ?_⟩
  intro a ha
  exact of_decide_eq_true (List.all_eq_true.mp hrows a (List.mem_range.mpr (mem_range.mp ha)))

theorem modulusBatch_sound {n lo count : ℕ} {A D : ℕ → ℤ}
    (h : (List.range count).all (fun j => modulusCheckBool n A D (lo + j)) = true)
    (m : ℕ) (hlo : lo ≤ m) (hhi : m < lo + count) : ModulusValid n A D m := by
  have hh := List.all_eq_true.mp h (m - lo) (List.mem_range.mpr (by omega))
  have heq : lo + (m - lo) = m := by omega
  rw [heq] at hh
  exact modulusCheckBool_sound hh

end IRDCS
