import IRDCS.GridWeights

namespace IRDCS
open Finset

def Endpoint.InUnit (e : Endpoint) : Prop := 0 < e.den ∧ 0 ≤ e.num ∧ e.num ≤ e.den
instance (e : Endpoint) : Decidable e.InUnit := inferInstanceAs (Decidable (_ ∧ _ ∧ _))

theorem floorAt_bounds (n : ℕ) (e : Endpoint) (he : e.InUnit) :
    0 ≤ floorAt n e ∧ floorAt n e ≤ n := by
  obtain ⟨hd, ha, hb⟩ := he
  have hn : (0 : ℤ) ≤ n := by omega
  constructor
  · unfold floorAt
    apply (Int.le_ediv_iff_mul_le hd).mpr
    simpa using mul_nonneg hn ha
  · unfold floorAt
    have hmul := mul_le_mul_of_nonneg_left hb hn
    have hh : (n : ℤ) * e.num < ((n : ℤ) + 1) * e.den := by nlinarith
    have := (Int.ediv_lt_iff_lt_mul hd).mpr hh
    omega

theorem ceilAt_bounds (n : ℕ) (hn : 0 < n) (e : Endpoint)
    (he : e.InUnit) (ha : 0 < e.num) : 1 ≤ ceilAt n e ∧ ceilAt n e ≤ n := by
  obtain ⟨hd, _, hb⟩ := he
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  unfold ceilAt floorAt
  constructor
  · have hh : -(n : ℤ) * e.num < (0 : ℤ) * e.den := by nlinarith
    have := (Int.ediv_lt_iff_lt_mul hd).mpr hh
    omega
  · have hh : -(n : ℤ) * e.den ≤ -(n : ℤ) * e.num := by nlinarith
    have := (Int.le_ediv_iff_mul_le hd).mpr hh
    omega

theorem sum_prefix (n : ℕ) (k w : ℤ) (hk : 0 ≤ k) (hkn : k ≤ n) :
    (∑ x ∈ Icc 1 n, if (x : ℤ) ≤ k then w else 0) = k * w := by
  rw [← sum_filter]
  have hcast : (k.toNat : ℤ) = k := Int.toNat_of_nonneg hk
  have hkn' : k.toNat ≤ n := by exact_mod_cast (hcast ▸ hkn)
  have hset : (Icc 1 n).filter (fun x : ℕ => (x : ℤ) ≤ k) = Icc 1 k.toNat := by
    ext x
    simp only [mem_filter, mem_Icc]
    have hiff : (x : ℤ) ≤ k ↔ x ≤ k.toNat := by rw [← hcast]; exact_mod_cast Iff.rfl
    rw [hiff]
    omega
  rw [hset]
  simp [sum_const, nsmul_eq_mul, Nat.card_Icc, hcast]

theorem sum_interval (n : ℕ) (l r w : ℤ)
    (hl : 0 ≤ l) (hlr : l ≤ r) (hrn : r ≤ n) :
    (∑ x ∈ Icc 1 n, if l < (x : ℤ) ∧ (x : ℤ) ≤ r then w else 0) = w * (r - l) := by
  have hpoint (x : ℕ) :
      (if l < (x : ℤ) ∧ (x : ℤ) ≤ r then w else 0) =
        (if (x : ℤ) ≤ r then w else 0) - (if (x : ℤ) ≤ l then w else 0) := by
    by_cases hxL : (x : ℤ) ≤ l <;> by_cases hxR : (x : ℤ) ≤ r
    · simp [hxL, hxR, not_lt.mpr hxL]
    · omega
    · simp [hxL, hxR, lt_of_not_ge hxL]
    · simp [hxL, hxR]
  simp_rw [hpoint]
  rw [sum_sub_distrib, sum_prefix n r w (by omega) hrn,
    sum_prefix n l w hl (by omega)]
  ring

theorem floorAt_le_floorAt (n : ℕ) (l r : Endpoint)
    (hl : l.InUnit) (hr : r.InUnit)
    (horder : l.num * r.den ≤ r.num * l.den) : floorAt n l ≤ floorAt n r := by
  have hn : (0 : ℤ) ≤ n := by omega
  have hleft : floorAt n l * l.den ≤ (n : ℤ) * l.num :=
    (Int.le_ediv_iff_mul_le hl.1).mp le_rfl
  have hright : (n : ℤ) * r.num < (floorAt n r + 1) * r.den :=
    (Int.ediv_lt_iff_lt_mul hr.1).mp (by unfold floorAt; omega)
  have h1 := mul_le_mul_of_nonneg_right hleft hr.1.le
  have h2 := mul_lt_mul_of_pos_right hright hl.1
  have h3 := mul_le_mul_of_nonneg_left horder hn
  have hden := mul_pos hl.1 hr.1
  by_contra h
  have h4 := mul_le_mul_of_nonneg_right (show floorAt n r + 1 ≤ floorAt n l by omega) hden.le
  nlinarith

theorem floorAt_lt_ceilAt (n : ℕ) (hn : 0 < n) (l r : Endpoint)
    (hl : l.InUnit) (hr : r.InUnit)
    (horder : l.num * r.den < r.num * l.den) : floorAt n l < ceilAt n r := by
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  have hleft : floorAt n l * l.den ≤ (n : ℤ) * l.num :=
    (Int.le_ediv_iff_mul_le hl.1).mp le_rfl
  have hright : (n : ℤ) * r.num ≤ ceilAt n r * r.den := by
    have hh : floorAt (-(n : ℤ)) r * r.den ≤ -(n : ℤ) * r.num :=
      (Int.le_ediv_iff_mul_le hr.1).mp le_rfl
    unfold ceilAt
    nlinarith
  have h1 := mul_le_mul_of_nonneg_right hleft hr.1.le
  have h2 := mul_le_mul_of_nonneg_right hright hl.1.le
  have h3 := mul_lt_mul_of_pos_left horder hn'
  have hden := mul_pos hl.1 hr.1
  by_contra h
  have h4 := mul_le_mul_of_nonneg_right (show ceilAt n r ≤ floorAt n l by omega) hden.le
  nlinarith

theorem sum_binOnGrid (n : ℕ) (b : ClosedBin)
    (hl : b.left.InUnit) (hr : b.right.InUnit)
    (horder : b.left.num * b.right.den ≤ b.right.num * b.left.den) :
    (∑ x ∈ Icc 1 n, binOnGrid n x b) = binValue n b := by
  have hcond (x : ℕ) :
      ((n : ℤ) * b.left.num < (x : ℤ) * b.left.den ∧
        (x : ℤ) * b.right.den ≤ (n : ℤ) * b.right.num) ↔
      (floorAt n b.left < x ∧ (x : ℤ) ≤ floorAt n b.right) := by
    rw [← Int.ediv_lt_iff_lt_mul hl.1, ← Int.le_ediv_iff_mul_le hr.1]
    rfl
  unfold binOnGrid binValue
  simp_rw [hcond]
  exact sum_interval n (floorAt n b.left) (floorAt n b.right) b.weight
    (floorAt_bounds n b.left hl).1 (floorAt_le_floorAt n b.left b.right hl hr horder)
    (floorAt_bounds n b.right hr).2

theorem sum_segmentOnGrid (n : ℕ) (hn : 0 < n) (s : OpenSegment)
    (hl : s.left.InUnit) (hr : s.right.InUnit) (ha : 0 < s.right.num)
    (horder : s.left.num * s.right.den < s.right.num * s.left.den) :
    (∑ x ∈ Icc 1 n, segmentOnGrid n x s) = openValue n s := by
  have hcond (x : ℕ) :
      ((n : ℤ) * s.left.num < (x : ℤ) * s.left.den ∧
        (x : ℤ) * s.right.den < (n : ℤ) * s.right.num) ↔
      (floorAt n s.left < x ∧ (x : ℤ) ≤ ceilAt n s.right - 1) := by
    rw [← Int.ediv_lt_iff_lt_mul hl.1]
    have hright : (x : ℤ) ≤ ceilAt n s.right - 1 ↔
        (x : ℤ) * s.right.den < (n : ℤ) * s.right.num := by
      unfold ceilAt floorAt
      have hh := Int.ediv_lt_iff_lt_mul (a := -(n : ℤ) * s.right.num) (b := -(x : ℤ)) hr.1
      constructor
      · intro hx
        have hh' : -(n : ℤ) * s.right.num / s.right.den < -(x : ℤ) := by omega
        have := hh.mp hh'
        nlinarith
      · intro hx
        have hh' := hh.mpr (show -(n : ℤ) * s.right.num < -(x : ℤ) * s.right.den by nlinarith)
        omega
    rw [hright]
    rfl
  unfold segmentOnGrid openValue
  simp_rw [hcond]
  convert sum_interval n (floorAt n s.left) (ceilAt n s.right - 1) s.weight
    (floorAt_bounds n s.left hl).1 (by have := floorAt_lt_ceilAt n hn s.left s.right hl hr horder; omega)
    (by have := (ceilAt_bounds n hn s.right hr ha).2; omega) using 1 <;> ring

theorem sum_boundaryOnGrid (n : ℕ) (hn : 0 < n) (a : BoundaryAtom)
    (he : a.endpoint.InUnit) (ha : 0 < a.endpoint.num) :
    (∑ x ∈ Icc 1 n, boundaryOnGrid n x a) = boundaryValue n a := by
  let q := floorAt n a.endpoint
  have hq := floorAt_bounds n a.endpoint he
  by_cases hmod : (n : ℤ) * a.endpoint.num % a.endpoint.den = 0
  · have heq : q * a.endpoint.den = (n : ℤ) * a.endpoint.num :=
      Int.ediv_mul_cancel_of_emod_eq_zero hmod
    have hn' : (0 : ℤ) < n := by exact_mod_cast hn
    have hpos : 0 < q := by
      have hd := he.1
      by_contra h
      have hh := mul_nonpos_of_nonpos_of_nonneg (show q ≤ 0 by omega) hd.le
      nlinarith [mul_pos hn' ha]
    have hcast : (q.toNat : ℤ) = q := Int.toNat_of_nonneg hq.1
    have hmem : q.toNat ∈ Icc 1 n := by
      simp only [mem_Icc]
      constructor <;> omega
    rw [sum_eq_single q.toNat]
    · simp [boundaryOnGrid, boundaryValue, atomAt, hmod, hcast, heq]
    · intro b hb hne
      have hneq : (b : ℤ) * a.endpoint.den ≠ (n : ℤ) * a.endpoint.num := by
        intro hbq
        have hbq' : (b : ℤ) = q := by nlinarith [he.1]
        have : b = q.toNat := by omega
        exact hne this
      simp [boundaryOnGrid, hneq]
    · intro h
      exact False.elim (h hmem)
  · have hz (b : ℕ) : boundaryOnGrid n b a = 0 := by
      have hneq : (b : ℤ) * a.endpoint.den ≠ (n : ℤ) * a.endpoint.num := by
        intro h
        apply hmod
        rw [← h, Int.mul_emod_left]
      simp [boundaryOnGrid, hneq]
    simp [hz, boundaryValue, atomAt, hmod]

theorem sum_map_swap {α : Type} (xs : List α) (M : Finset ℕ) (f : ℕ → α → ℤ) :
    (∑ x ∈ M, (xs.map (f x)).sum) = (xs.map (fun a => ∑ x ∈ M, f x a)).sum := by
  induction xs with
  | nil => simp
  | cons a xs ih => simp only [List.map_cons, List.sum_cons, sum_add_distrib, ih]

theorem actual_bin_endpoints : ∀ b ∈ Generated.bins,
    b.left.InUnit ∧ b.right.InUnit ∧ b.left.num * b.right.den ≤ b.right.num * b.left.den := by
  decide

theorem actual_segment_endpoints : ∀ s ∈ Generated.segments,
    s.left.InUnit ∧ s.right.InUnit ∧ 0 < s.right.num ∧
      s.left.num * s.right.den < s.right.num * s.left.den := by decide

theorem actual_atom_endpoints : ∀ a ∈ Generated.atoms,
    a.endpoint.InUnit ∧ 0 < a.endpoint.num := by decide

/-- Exact count of every bin, open segment, and boundary atom on the integer grid. -/
theorem grid_sum_identity : GridSumIdentity := by
  intro n hn
  unfold pointWeight modulusWeight Generated.S gridTotal
  rw [sum_add_distrib, sum_map_swap, sum_map_swap, sum_map_swap]
  have hb : (Generated.bins.map (fun b => ∑ x ∈ Icc 1 n, binOnGrid n x b)).sum =
      (Generated.bins.map (binValue n)).sum := by
    congr 1
    apply List.map_congr_left
    intro b hb
    obtain ⟨hl, hr, ho⟩ := actual_bin_endpoints b hb
    exact sum_binOnGrid n b hl hr ho
  have hs : (Generated.segments.map (fun s => ∑ x ∈ Icc 1 n, segmentOnGrid n x s)).sum =
      (Generated.segments.map (openValue n)).sum := by
    congr 1
    apply List.map_congr_left
    intro s hs
    obtain ⟨hl, hr, ha, ho⟩ := actual_segment_endpoints s hs
    exact sum_segmentOnGrid n hn s hl hr ha ho
  have ha : (Generated.atoms.map (fun a => ∑ x ∈ Icc 1 n, boundaryOnGrid n x a)).sum =
      (Generated.atoms.map (boundaryValue n)).sum := by
    congr 1
    apply List.map_congr_left
    intro a ha
    obtain ⟨he, hp⟩ := actual_atom_endpoints a ha
    exact sum_boundaryOnGrid n hn a he hp
  rw [hb, hs, ha]
  ring

end IRDCS
