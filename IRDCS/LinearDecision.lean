import IRDCS.LinearCertificate

namespace IRDCS.Linear

inductive Expr where
  | const : ℤ → Expr
  | add : Expr → Expr → Expr
  | ite : Constraint → Expr → Expr → Expr
  deriving Repr

def Expr.eval (n m t : ℤ) : Expr → ℤ
  | .const w => w
  | .add a b => a.eval n m t + b.eval n m t
  | .ite c a b => if c.Holds n m t then a.eval n m t else b.eval n m t

/-- A conservative lower bound using only explicitly certified comparisons. -/
def Known (ctx : List Constraint) (c : Constraint) : Prop := ∃ a ∈ ctx, a.Dominates c

instance (ctx : List Constraint) (c : Constraint) : Decidable (Known ctx c) := by
  unfold Known; infer_instance

def knownBool (ctx : List Constraint) (c : Constraint) : Bool :=
  ctx.any (fun a => decide (a.Dominates c))

theorem knownBool_iff (ctx : List Constraint) (c : Constraint) :
    knownBool ctx c = true ↔ Known ctx c := by
  simp [knownBool, Known]

theorem known_sound (ctx : List Constraint) (c : Constraint) (n m t : ℤ) (hn : 0 < n)
    (hh : ∀ a ∈ ctx, a.Holds n m t) (h : Known ctx c) : c.Holds n m t := by
  obtain ⟨a, ha, hd⟩ := h
  exact dominates_sound a c n m t hn hd (hh a ha)

def Expr.lower (ctx : List Constraint) : Expr → ℤ
  | .const w => w
  | .add a b => a.lower ctx + b.lower ctx
  | .ite c a b => if knownBool ctx c then a.lower ctx
      else if knownBool ctx c.negate then b.lower ctx else min (a.lower ctx) (b.lower ctx)

theorem lower_sound (e : Expr) (ctx : List Constraint) (n m t : ℤ) (hn : 0 < n)
    (hh : ∀ c ∈ ctx, c.Holds n m t) : e.lower ctx ≤ e.eval n m t := by
  induction e with
  | const w => exact le_rfl
  | add a b ha hb => exact add_le_add ha hb
  | ite c a b ha hb =>
    unfold Expr.lower Expr.eval
    by_cases hc : knownBool ctx c = true
    · simp only [if_pos hc, if_pos (known_sound ctx c n m t hn hh ((knownBool_iff ctx c).mp hc))]
      exact ha
    · rw [if_neg hc]
      by_cases hnc : knownBool ctx c.negate = true
      · rw [if_pos hnc, if_neg ((negate_holds c n m t).mp (known_sound ctx c.negate n m t hn hh
          ((knownBool_iff ctx c.negate).mp hnc)))]
        exact hb
      · rw [if_neg hnc]
        split_ifs
        · exact (min_le_left _ _).trans ha
        · exact (min_le_right _ _).trans hb

inductive Tree where
  | done : Tree
  | impossible : Certificate → Tree
  | split : Constraint → Tree → Tree → Tree
  | force : Constraint → Certificate → Tree → Tree
  deriving Repr

def Tree.Check (e : Expr) (ctx : List Constraint) : Tree → Prop
  | .done => 0 ≤ e.lower ctx
  | .impossible cs => cs.Valid ctx
  | .split c a b => a.Check e (c :: ctx) ∧ b.Check e (c.negate :: ctx)
  | .force c cs a => cs.Valid (c.negate :: ctx) ∧ a.Check e (c :: ctx)

def checkDecidable (e : Expr) (ctx : List Constraint) (tree : Tree) : Decidable (tree.Check e ctx) :=
  match tree with
  | .done => inferInstanceAs (Decidable (0 ≤ e.lower ctx))
  | .impossible cs => inferInstanceAs (Decidable (cs.Valid ctx))
  | .split c a b => @instDecidableAnd _ _ (checkDecidable e (c :: ctx) a)
      (checkDecidable e (c.negate :: ctx) b)
  | .force c cs a => @instDecidableAnd _ _ (inferInstanceAs (Decidable (cs.Valid (c.negate :: ctx))))
      (checkDecidable e (c :: ctx) a)

instance (e : Expr) (ctx : List Constraint) (tree : Tree) : Decidable (tree.Check e ctx) :=
  checkDecidable e ctx tree

def Tree.checkBool (e : Expr) (ctx : List Constraint) : Tree → Bool
  | .done => decide (0 ≤ e.lower ctx)
  | .impossible cs => decide (cs.Valid ctx)
  | .split c a b => a.checkBool e (c :: ctx) && b.checkBool e (c.negate :: ctx)
  | .force c cs a => decide (cs.Valid (c.negate :: ctx)) && a.checkBool e (c :: ctx)

theorem checkBool_sound (tree : Tree) (e : Expr) (ctx : List Constraint)
    (h : tree.checkBool e ctx = true) : tree.Check e ctx := by
  induction tree generalizing ctx with
  | done => exact of_decide_eq_true h
  | impossible cs => exact of_decide_eq_true h
  | split c a b ha hb =>
    obtain ⟨hca, hcb⟩ := Bool.and_eq_true_iff.mp h
    exact ⟨ha (c :: ctx) hca, hb (c.negate :: ctx) hcb⟩
  | force c cs a ha =>
    obtain ⟨hcert, hnext⟩ := Bool.and_eq_true_iff.mp h
    exact ⟨of_decide_eq_true hcert, ha (c :: ctx) hnext⟩

/-- Every branch is exhaustive. Forced signs require exact infeasibility proofs
for their negation, and all arithmetic is checked by the Lean kernel. -/
theorem tree_sound (tree : Tree) (e : Expr) (ctx : List Constraint)
    (hcheck : tree.Check e ctx) (n m t : ℤ) (hn : 0 < n)
    (hh : ∀ c ∈ ctx, c.Holds n m t) : 0 ≤ e.eval n m t := by
  induction tree generalizing ctx with
  | done => exact hcheck.trans (lower_sound e ctx n m t hn hh)
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

end IRDCS.Linear
