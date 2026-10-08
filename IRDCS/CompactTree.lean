import IRDCS.CompactLeaf

namespace IRDCS
open Linear

inductive CompactTree where
  | leaf : LeafWitness → CompactTree
  | impossible : Certificate → CompactTree
  | split : Constraint → CompactTree → CompactTree → CompactTree
  | force : Constraint → Certificate → CompactTree → CompactTree
  deriving Repr

def CompactTree.Check (ctx : List Constraint) : CompactTree → Prop
  | .leaf w => w.Valid ctx
  | .impossible cs => cs.Valid ctx
  | .split c a b => a.Check (c :: ctx) ∧ b.Check (c.negate :: ctx)
  | .force c cs a => cs.Valid (c.negate :: ctx) ∧ a.Check (c :: ctx)

def CompactTree.checkBool (ctx : List Constraint) : CompactTree → Bool
  | .leaf w => decide (w.Valid ctx)
  | .impossible cs => decide (cs.Valid ctx)
  | .split c a b => a.checkBool (c :: ctx) && b.checkBool (c.negate :: ctx)
  | .force c cs a => decide (cs.Valid (c.negate :: ctx)) && a.checkBool (c :: ctx)

theorem compactCheck_sound (tree : CompactTree) (ctx : List Constraint)
    (h : tree.checkBool ctx = true) : tree.Check ctx := by
  induction tree generalizing ctx with
  | leaf w =>
    change w.Valid ctx
    exact of_decide_eq_true h
  | impossible cs =>
    change cs.Valid ctx
    exact of_decide_eq_true h
  | split c a b ha hb =>
    obtain ⟨hca, hcb⟩ := Bool.and_eq_true_iff.mp h
    exact ⟨ha (c :: ctx) hca, hb (c.negate :: ctx) hcb⟩
  | force c cs a ha =>
    obtain ⟨hcert, hnext⟩ := Bool.and_eq_true_iff.mp h
    exact ⟨of_decide_eq_true hcert, ha (c :: ctx) hnext⟩

theorem compactTree_sound (tree : CompactTree) (ctx : List Constraint) (hcheck : tree.Check ctx)
    (n m t : ℕ) (hn : 0 < n) (ht : 0 < t) (hh : ∀ c ∈ ctx, c.Holds n m t) :
    0 ≤ universalRowExpr.eval n m t := by
  induction tree generalizing ctx with
  | leaf w => exact leafWitness_sound w ctx n m t hcheck hn ht hh
  | impossible cs => exact False.elim (certificate_sound ctx cs hcheck n m t hh)
  | split c a b ha hb =>
    obtain ⟨hca, hcb⟩ := hcheck
    by_cases hc : c.Holds n m t
    · apply ha (c :: ctx) hca
      intro d hd
      rcases List.mem_cons.mp hd with rfl | hd
      · exact hc
      · exact hh d hd
    · apply hb (c.negate :: ctx) hcb
      intro d hd
      rcases List.mem_cons.mp hd with rfl | hd
      · exact (negate_holds c n m t).mpr hc
      · exact hh d hd
  | force c cs a ha =>
    obtain ⟨hcert, hnext⟩ := hcheck
    have hc : c.Holds n m t := by
      by_contra h
      apply certificate_sound (c.negate :: ctx) cs hcert n m t
      intro d hd
      rcases List.mem_cons.mp hd with rfl | hd
      · exact (negate_holds c n m t).mpr h
      · exact hh d hd
    apply ha (c :: ctx) hnext
    intro d hd
    rcases List.mem_cons.mp hd with rfl | hd
    · exact hc
    · exact hh d hd

/-- A compact certificate still proves the exact unbounded complete-row law. -/
theorem universalRowBound_of_compactTree (tree : CompactTree)
    (hc : tree.Check rowDomain) : UniversalRowBound := by
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
  have hbound := compactTree_sound tree rowDomain hc n m (firstRep m a) hn htpos hh
  rw [universalRowExpr_eval] at hbound
  rw [six_term_row_sum hmpos hnm]
  exact hbound

end IRDCS
