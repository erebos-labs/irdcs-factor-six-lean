import IRDCS.RowBounds
import IRDCS.LinearDecision
import IRDCS.PointLookup

namespace IRDCS
open Finset
open Linear

def rowPointExpr (j : ℕ) (b : ClosedBin) : Expr :=
  .ite ⟨⟨-b.left.num, (j : ℤ) * b.left.den, b.left.den⟩, true⟩
    (.ite ⟨⟨b.right.num, -(j : ℤ) * b.right.den, -b.right.den⟩, false⟩
      (.const b.weight) (.const 0)) (.const 0)

def segmentExpr (s : OpenSegment) : Expr :=
  .ite ⟨⟨-s.left.num, s.left.den, 0⟩, true⟩
    (.ite ⟨⟨s.right.num, -s.right.den, 0⟩, true⟩
      (.const s.weight) (.const 0)) (.const 0)

def atomExpr (a : BoundaryAtom) : Expr :=
  .ite ⟨⟨-a.endpoint.num, a.endpoint.den, 0⟩, false⟩
    (.ite ⟨⟨a.endpoint.num, -a.endpoint.den, 0⟩, false⟩
      (.const a.weight) (.const 0)) (.const 0)

def sumExpr (xs : List Expr) : Expr := xs.foldr Expr.add (.const 0)

theorem sumExpr_eval (xs : List Expr) (n m t : ℤ) :
    (sumExpr xs).eval n m t = (xs.map (Expr.eval n m t)).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    change x.eval n m t + (sumExpr xs).eval n m t = _
    simp only [List.map_cons, List.sum_cons, ih]

def universalRowExpr : Expr := sumExpr (
  (List.range 6).flatMap (fun j => Generated.bins.map (rowPointExpr j)) ++
  Generated.segments.map segmentExpr ++ Generated.atoms.map atomExpr)

theorem rowPointExpr_eval (n m t j : ℕ) (b : ClosedBin) :
    (rowPointExpr j b).eval n m t = binOnGrid n (t + j * m) b := by
  have hleft : (-b.left.num * (n : ℤ) + (j : ℤ) * b.left.den * m + b.left.den * t > 0) ↔
      (n : ℤ) * b.left.num < ((t + j * m : ℕ) : ℤ) * b.left.den := by
    push_cast; constructor <;> intro h <;> nlinarith
  have hright : (0 ≤ b.right.num * (n : ℤ) + -(j : ℤ) * b.right.den * m + -b.right.den * t) ↔
      ((t + j * m : ℕ) : ℤ) * b.right.den ≤ (n : ℤ) * b.right.num := by
    push_cast; constructor <;> intro h <;> nlinarith
  change (if 0 < -b.left.num * (n : ℤ) + (j : ℤ) * b.left.den * m + b.left.den * t then
    if 0 ≤ b.right.num * (n : ℤ) + -(j : ℤ) * b.right.den * m + -b.right.den * t
      then b.weight else 0 else 0) = _
  simp only [hleft, hright]
  unfold binOnGrid
  split_ifs <;> simp_all <;> omega

theorem segmentExpr_eval (n m t : ℕ) (s : OpenSegment) :
    (segmentExpr s).eval n m t = segmentOnGrid n m s := by
  have hl : (0 < -s.left.num * (n : ℤ) + s.left.den * m + 0 * t) ↔
      (n : ℤ) * s.left.num < (m : ℤ) * s.left.den := by constructor <;> intro h <;> nlinarith
  have hr : (0 < s.right.num * (n : ℤ) + -s.right.den * m + 0 * t) ↔
      (m : ℤ) * s.right.den < (n : ℤ) * s.right.num := by constructor <;> intro h <;> nlinarith
  change (if 0 < -s.left.num * (n : ℤ) + s.left.den * m + 0 * t then
    if 0 < s.right.num * (n : ℤ) + -s.right.den * m + 0 * t then s.weight else 0 else 0) = _
  simp only [hl, hr]
  unfold segmentOnGrid
  split_ifs <;> simp_all

theorem atomExpr_eval (n m t : ℕ) (a : BoundaryAtom) :
    (atomExpr a).eval n m t = boundaryOnGrid n m a := by
  have hh : (0 ≤ -a.endpoint.num * (n : ℤ) + a.endpoint.den * m + 0 * t ∧
      0 ≤ a.endpoint.num * (n : ℤ) + -a.endpoint.den * m + 0 * t) ↔
      (m : ℤ) * a.endpoint.den = (n : ℤ) * a.endpoint.num := by
    constructor
    · intro h; nlinarith
    · intro h; constructor <;> nlinarith
  change (if 0 ≤ -a.endpoint.num * (n : ℤ) + a.endpoint.den * m + 0 * t then
    if 0 ≤ a.endpoint.num * (n : ℤ) + -a.endpoint.den * m + 0 * t then a.weight else 0 else 0) = _
  rw [← ite_and]
  simp only [hh]
  rfl

theorem six_term_row_sum {n m a : ℕ} (hm : 0 < m) (hn : n ≤ 6 * m) :
    (∑ x ∈ row n m a, pointWeight n x) =
      ∑ j ∈ range 6, pointWeight n (firstRep m a + j * m) := by
  rw [row_eq_shortRow hm hn]
  unfold shortRow
  rw [sum_filter]
  have heq (x : ℕ) : (if x ≤ n then pointWeight n x else 0) = pointWeight n x := by
    by_cases hx : x ≤ n
    · simp [hx]
    · simp [hx, pointWeight_outside (by omega : n < x)]
  simp_rw [heq]
  rw [sum_image]
  intro j hj k hk h
  nlinarith

theorem list_flatMap_sum {α β : Type} (xs : List α) (ys : α → List β) (f : β → ℤ) :
    ((xs.flatMap ys).map f).sum = (xs.map (fun a => ((ys a).map f).sum)).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [List.flatMap_cons, List.map_append, List.sum_append, ih]

theorem universalRowExpr_eval (n m t : ℕ) :
    universalRowExpr.eval n m t =
      (∑ j ∈ range 6, pointWeight n (t + j * m)) + modulusWeight n m := by
  unfold universalRowExpr
  rw [sumExpr_eval]
  simp only [List.map_append, List.sum_append, list_flatMap_sum, List.map_map,
    Function.comp_def, rowPointExpr_eval, segmentExpr_eval, atomExpr_eval]
  unfold pointWeight modulusWeight
  have hrange : (List.range 6).toFinset = range 6 := by ext j; simp
  rw [← List.sum_toFinset _ List.nodup_range, hrange]
  ring

def rowDomain : List Constraint := [
  ⟨⟨1, 0, 0⟩, true⟩,    -- n > 0
  ⟨⟨0, 0, 1⟩, true⟩,    -- t > 0
  ⟨⟨0, 1, -1⟩, false⟩,  -- t ≤ m
  ⟨⟨-1, 6, 0⟩, false⟩,  -- n ≤ 6m
  ⟨⟨1, -2, -1⟩, false⟩] -- t + 2m ≤ n

/-- A successful finite linear decision certificate proves the unbounded row law. -/
theorem universalRowBound_of_tree (tree : Linear.Tree)
    (hc : tree.Check universalRowExpr rowDomain) : UniversalRowBound := by
  intro n m a hn hm hnm hcard
  have hmpos : 0 < m := by omega
  have htpos := firstRep_pos (a := a) hmpos
  have htle := firstRep_le (a := a) hmpos
  have hthird := third_member_le hmpos hnm hcard
  have hh : ∀ c ∈ rowDomain, c.Holds n m (firstRep m a) := by
    intro c hc
    simp only [rowDomain, List.mem_cons, List.not_mem_nil, or_false] at hc
    rcases hc with rfl | rfl | rfl | rfl | rfl <;>
      simp only [Constraint.Holds, Form.eval] <;> norm_num <;> omega
  have hbound := tree_sound tree universalRowExpr rowDomain hc n m (firstRep m a)
    (by exact_mod_cast hn) hh
  rw [universalRowExpr_eval] at hbound
  rw [six_term_row_sum hmpos hnm]
  exact hbound

end IRDCS
