import IRDCS.RowExpression

namespace IRDCS
open Finset Linear

structure PointWitness where
  lo : ℕ
  hi : ℕ
  value : ℤ
  deriving Repr

def lowerPointConstraint (j q : ℕ) : Constraint := ⟨⟨-(q : ℤ), 60 * j, 60⟩, true⟩
def upperPointConstraint (j q : ℕ) : Constraint := ⟨⟨q, -60 * j, -60⟩, false⟩

def PointWitness.Valid (w : PointWitness) (ctx : List Constraint) (j : ℕ) : Prop :=
  w.lo ≤ 60 ∧ 0 < w.hi ∧ w.hi ≤ 61 ∧ w.lo < w.hi ∧
    (w.lo = 0 ∨ Known ctx (lowerPointConstraint j w.lo)) ∧
    (w.hi = 61 ∨ Known ctx (upperPointConstraint j w.hi)) ∧
    ∀ q ∈ range 61, w.lo ≤ q → q < w.hi → w.value ≤ Generated.pointTable.getD q 0

instance (w : PointWitness) (ctx : List Constraint) (j : ℕ) : Decidable (w.Valid ctx j) := by
  unfold PointWitness.Valid; infer_instance

theorem lowerPoint_holds (n m t j q : ℕ) :
    (lowerPointConstraint j q).Holds n m t ↔ (q : ℤ) * n < 60 * ((t + j * m : ℕ) : ℤ) := by
  unfold lowerPointConstraint Constraint.Holds Form.eval
  simp only [Bool.true_eq, if_true, Nat.cast_add, Nat.cast_mul]
  constructor <;> intro h <;> nlinarith

theorem upperPoint_holds (n m t j q : ℕ) :
    (upperPointConstraint j q).Holds n m t ↔ 60 * ((t + j * m : ℕ) : ℤ) ≤ (q : ℤ) * n := by
  change (0 ≤ (q : ℤ) * n + -60 * j * m + -60 * t) ↔ _
  simp only [Nat.cast_add, Nat.cast_mul]
  constructor <;> intro h <;> nlinarith

theorem pointWitness_sound (w : PointWitness) (ctx : List Constraint) (j n m t : ℕ)
    (hw : w.Valid ctx j) (hn : 0 < n) (ht : 0 < t)
    (hh : ∀ c ∈ ctx, c.Holds n m t) : w.value ≤ pointWeight n (t + j * m) := by
  obtain ⟨hlo, hhip, hhi, horder, hl, hu, hv⟩ := hw
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  have hx : 0 < t + j * m := by omega
  by_cases hxn : t + j * m ≤ n
  · obtain ⟨q, hq, hbin⟩ := uniformBin_exists_below hn hx (show 60 * (t + j * m) ≤ 60 * n by omega)
    have hqlo : w.lo ≤ q := by
      rcases hl with hl | hl
      · omega
      · have hs := (lowerPoint_holds n m t j w.lo).mp (known_sound ctx _ n m t hn' hh hl)
        have hb := hbin.2
        by_contra h
        have hmul := mul_le_mul_of_nonneg_right (show (q : ℤ) + 1 ≤ w.lo by omega) hn'.le
        nlinarith
    have hqhi : q < w.hi := by
      rcases hu with hu | hu
      · omega
      · have hs := (upperPoint_holds n m t j w.hi).mp (known_sound ctx _ n m t hn' hh hu)
        have hb := hbin.1
        by_contra h
        have hmul := mul_le_mul_of_nonneg_right (show (w.hi : ℤ) ≤ q by omega) hn'.le
        nlinarith
    rw [pointWeight_of_uniformBin hn hq hbin]
    exact hv q (mem_range.mpr (by omega)) hqlo hqhi
  · have hhi61 : w.hi = 61 := by
      rcases hu with hu | hu
      · exact hu
      · have hs := (upperPoint_holds n m t j w.hi).mp (known_sound ctx _ n m t hn' hh hu)
        by_contra h
        have hle : (w.hi : ℤ) ≤ 60 := by omega
        have hmul := mul_le_mul_of_nonneg_right hle hn'.le
        have hx' : (n : ℤ) < ((t + j * m : ℕ) : ℤ) := by omega
        nlinarith
    rw [pointWeight_outside (by omega)]
    have hz : Generated.pointTable.getD 60 0 = 0 := by decide
    have hh' := hv 60 (mem_range.mpr (by omega)) hlo (by omega)
    simpa only [hz] using hh'

structure BudgetTerm where
  left : Constraint
  right : Constraint
  value : ℤ
  deriving DecidableEq, Repr

def segmentBudget (s : OpenSegment) : BudgetTerm :=
  ⟨⟨⟨-s.left.num, s.left.den, 0⟩, true⟩, ⟨⟨s.right.num, -s.right.den, 0⟩, true⟩, s.weight⟩
def atomBudget (a : BoundaryAtom) : BudgetTerm :=
  ⟨⟨⟨-a.endpoint.num, a.endpoint.den, 0⟩, false⟩,
    ⟨⟨a.endpoint.num, -a.endpoint.den, 0⟩, false⟩, a.weight⟩
def budgetTerms : List BudgetTerm := Generated.segments.map segmentBudget ++ Generated.atoms.map atomBudget

def BudgetTerm.Valid (b : BudgetTerm) (ctx : List Constraint) : Prop :=
  b ∈ budgetTerms ∧ Known ctx b.left ∧ Known ctx b.right
instance (b : BudgetTerm) (ctx : List Constraint) : Decidable (b.Valid ctx) := by
  unfold BudgetTerm.Valid; infer_instance

theorem member_le_map_sum {α : Type} (xs : List α) (f : α → ℤ) (a : α) (ha : a ∈ xs)
    (hf : ∀ x ∈ xs, 0 ≤ f x) : f a ≤ (xs.map f).sum := by
  induction xs with
  | nil => simp at ha
  | cons x xs ih =>
    have hx := hf x (by simp)
    have ht := sum_map_nonnegative xs f (fun a ha => hf a (by simp [ha]))
    simp only [List.mem_cons] at ha
    rcases ha with rfl | ha
    · simp only [List.map_cons, List.sum_cons]; omega
    · have hh := ih ha (fun a ha => hf a (by simp [ha]))
      simp only [List.map_cons, List.sum_cons]; omega

theorem segmentOnGrid_nonnegative (n m : ℕ) : ∀ s ∈ Generated.segments, 0 ≤ segmentOnGrid n m s := by
  intro s hs
  unfold segmentOnGrid
  split_ifs
  · exact actual_segments_nonnegative s hs
  · omega

theorem boundaryOnGrid_nonnegative (n m : ℕ) : ∀ a ∈ Generated.atoms, 0 ≤ boundaryOnGrid n m a := by
  intro a ha
  unfold boundaryOnGrid
  split_ifs
  · exact actual_atoms_nonnegative a ha
  · omega

theorem budgetTerm_sound (b : BudgetTerm) (ctx : List Constraint) (n m t : ℕ)
    (hb : b.Valid ctx) (hn : 0 < n) (hh : ∀ c ∈ ctx, c.Holds n m t) : b.value ≤ modulusWeight n m := by
  obtain ⟨hm, hl, hr⟩ := hb
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  have hleft := known_sound ctx _ n m t hn' hh hl
  have hright := known_sound ctx _ n m t hn' hh hr
  simp only [budgetTerms, List.mem_append, List.mem_map] at hm
  rcases hm with ⟨s, hs, rfl⟩ | ⟨a, ha, rfl⟩
  · have heq : segmentOnGrid n m s = s.weight := by
      rw [← segmentExpr_eval n m t s]
      change (if (segmentBudget s).left.Holds n m t then
        if (segmentBudget s).right.Holds n m t then s.weight else 0 else 0) = _
      rw [if_pos hleft, if_pos hright]
    have hv := member_le_map_sum Generated.segments (segmentOnGrid n m) s hs (segmentOnGrid_nonnegative n m)
    have hz := sum_map_nonnegative Generated.atoms (boundaryOnGrid n m) (boundaryOnGrid_nonnegative n m)
    unfold modulusWeight
    change s.weight ≤ _
    rw [heq] at hv
    omega
  · have heq : boundaryOnGrid n m a = a.weight := by
      rw [← atomExpr_eval n m t a]
      change (if (atomBudget a).left.Holds n m t then
        if (atomBudget a).right.Holds n m t then a.weight else 0 else 0) = _
      rw [if_pos hleft, if_pos hright]
    have hv := member_le_map_sum Generated.atoms (boundaryOnGrid n m) a ha (boundaryOnGrid_nonnegative n m)
    have hz := sum_map_nonnegative Generated.segments (segmentOnGrid n m) (segmentOnGrid_nonnegative n m)
    unfold modulusWeight
    change a.weight ≤ _
    rw [heq] at hv
    omega

structure LeafWitness where
  points : List PointWitness
  budget : Option BudgetTerm
  deriving Repr

def defaultPointWitness : PointWitness := ⟨0, 61, -1424⟩
def LeafWitness.budgetValue (w : LeafWitness) : ℤ := w.budget.elim 0 BudgetTerm.value

def LeafWitness.Valid (w : LeafWitness) (ctx : List Constraint) : Prop :=
  (∀ j ∈ range 6, (w.points.getD j defaultPointWitness).Valid ctx j) ∧
    (w.budget.elim True (fun b => b.Valid ctx)) ∧
    0 ≤ (∑ j ∈ range 6, (w.points.getD j defaultPointWitness).value) + w.budgetValue

instance (w : LeafWitness) (ctx : List Constraint) : Decidable (w.Valid ctx) := by
  unfold LeafWitness.Valid
  cases h : w.budget <;> simp only [h, Option.elim] <;> infer_instance

theorem leafWitness_sound (w : LeafWitness) (ctx : List Constraint) (n m t : ℕ)
    (hw : w.Valid ctx) (hn : 0 < n) (ht : 0 < t) (hh : ∀ c ∈ ctx, c.Holds n m t) :
    0 ≤ universalRowExpr.eval n m t := by
  obtain ⟨hp, hb, hs⟩ := hw
  have hpoints : (∑ j ∈ range 6, (w.points.getD j defaultPointWitness).value) ≤
      ∑ j ∈ range 6, pointWeight n (t + j * m) := by
    apply sum_le_sum
    intro j hj
    exact pointWitness_sound _ ctx j n m t (hp j hj) hn ht hh
  have hbudget : w.budgetValue ≤ modulusWeight n m := by
    cases heq : w.budget with
    | none => simpa [LeafWitness.budgetValue, heq] using modulusWeight_nonnegative n m
    | some b =>
      have hb' : b.Valid ctx := by simpa [heq] using hb
      simpa [LeafWitness.budgetValue, heq] using budgetTerm_sound b ctx n m t hb' hn hh
  rw [universalRowExpr_eval]
  omega

end IRDCS
