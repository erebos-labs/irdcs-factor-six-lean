import IRDCS.GridCounting

namespace IRDCS.Linear

/-- Homogeneous integer linear form in the unbounded variables n, m, t. -/
structure Form where
  cn : ℤ
  cm : ℤ
  ct : ℤ
  deriving DecidableEq, Repr

def Form.eval (f : Form) (n m t : ℤ) : ℤ := f.cn * n + f.cm * m + f.ct * t
def Form.zero : Form := ⟨0, 0, 0⟩
def Form.add (a b : Form) : Form := ⟨a.cn + b.cn, a.cm + b.cm, a.ct + b.ct⟩
def Form.scale (w : ℕ) (a : Form) : Form := ⟨w * a.cn, w * a.cm, w * a.ct⟩
def Form.neg (a : Form) : Form := ⟨-a.cn, -a.cm, -a.ct⟩

structure Constraint where
  form : Form
  strict : Bool
  deriving DecidableEq, Repr

def Constraint.Holds (a : Constraint) (n m t : ℤ) : Prop :=
  if a.strict then 0 < a.form.eval n m t else 0 ≤ a.form.eval n m t

instance (a : Constraint) (n m t : ℤ) : Decidable (a.Holds n m t) := by
  unfold Constraint.Holds; infer_instance

def Constraint.negate (a : Constraint) : Constraint := ⟨a.form.neg, !a.strict⟩

theorem negate_holds (a : Constraint) (n m t : ℤ) :
    a.negate.Holds n m t ↔ ¬a.Holds n m t := by
  cases a with | mk f strict =>
    cases strict <;> simp [Constraint.negate, Constraint.Holds, Form.eval, Form.neg] <;> omega

/-- Parallel comparisons can be propagated using positivity of the length. -/
def Constraint.Dominates (a b : Constraint) : Prop :=
  a.form.cm = b.form.cm ∧ a.form.ct = b.form.ct ∧ a.form.cn ≤ b.form.cn ∧
    (b.strict = false ∨ a.strict = true ∨ a.form.cn < b.form.cn)

instance (a b : Constraint) : Decidable (a.Dominates b) := by
  unfold Constraint.Dominates; infer_instance

theorem dominates_sound (a b : Constraint) (n m t : ℤ) (hn : 0 < n)
    (hd : a.Dominates b) (ha : a.Holds n m t) : b.Holds n m t := by
  obtain ⟨hcm, hct, hcn, hs⟩ := hd
  have heval : b.form.eval n m t = a.form.eval n m t + (b.form.cn - a.form.cn) * n := by
    unfold Form.eval
    rw [hcm, hct]
    ring
  have hprod : 0 ≤ (b.form.cn - a.form.cn) * n := mul_nonneg (by omega) hn.le
  have han : 0 ≤ a.form.eval n m t := by
    unfold Constraint.Holds at ha
    split at ha <;> omega
  unfold Constraint.Holds
  rw [heval]
  split
  · rename_i hb
    rcases hs with hs | hs | hs
    · simp_all
    · have hap : 0 < a.form.eval n m t := by simpa [Constraint.Holds, hs] using ha
      omega
    · have hp := mul_pos (show 0 < b.form.cn - a.form.cn by omega) hn
      omega
  · omega

abbrev Certificate := List (ℕ × Constraint)

def combinedForm : Certificate → Form
  | [] => Form.zero
  | (w, c) :: cs => (c.form.scale w).add (combinedForm cs)

def combinedStrict (cs : Certificate) : Bool :=
  cs.any (fun wc => decide (0 < wc.1) && wc.2.strict)

def Certificate.Valid (ctx : List Constraint) (cs : Certificate) : Prop :=
  (∀ wc ∈ cs, wc.2 ∈ ctx) ∧ combinedForm cs = Form.zero ∧ combinedStrict cs = true

instance (ctx : List Constraint) (cs : Certificate) : Decidable (cs.Valid ctx) := by
  unfold Certificate.Valid; infer_instance

theorem combined_nonnegative (cs : Certificate) (n m t : ℤ)
    (hh : ∀ wc ∈ cs, wc.2.Holds n m t) :
    0 ≤ (combinedForm cs).eval n m t := by
  induction cs with
  | nil => simp [combinedForm, Form.zero, Form.eval]
  | cons wc cs ih =>
    obtain ⟨w, c⟩ := wc
    have hc := hh (w, c) (by simp)
    change c.Holds n m t at hc
    have ht := ih (fun a ha => hh a (by simp [ha]))
    have hw : (0 : ℤ) ≤ w := by omega
    have hcn : 0 ≤ c.form.eval n m t := by
      unfold Constraint.Holds at hc
      split at hc <;> omega
    have hprod := mul_nonneg hw hcn
    have heval : (combinedForm ((w, c) :: cs)).eval n m t =
        (w : ℤ) * c.form.eval n m t + (combinedForm cs).eval n m t := by
      simp [combinedForm, Form.eval, Form.scale, Form.add]; ring
    rw [heval]
    omega

theorem combined_positive (cs : Certificate) (n m t : ℤ)
    (hh : ∀ wc ∈ cs, wc.2.Holds n m t) (hs : combinedStrict cs = true) :
    0 < (combinedForm cs).eval n m t := by
  induction cs with
  | nil => simp [combinedStrict] at hs
  | cons wc cs ih =>
    obtain ⟨w, c⟩ := wc
    have hc := hh (w, c) (by simp)
    change c.Holds n m t at hc
    have htail : ∀ a ∈ cs, a.2.Holds n m t := fun a ha => hh a (by simp [ha])
    have ht := combined_nonnegative cs n m t htail
    have hw : (0 : ℤ) ≤ w := by omega
    have hcn : 0 ≤ c.form.eval n m t := by
      unfold Constraint.Holds at hc
      split at hc <;> omega
    have hprod := mul_nonneg hw hcn
    have heval : (combinedForm ((w, c) :: cs)).eval n m t =
        (w : ℤ) * c.form.eval n m t + (combinedForm cs).eval n m t := by
      simp [combinedForm, Form.eval, Form.scale, Form.add]; ring
    rw [heval]
    simp only [combinedStrict, List.any_cons, Bool.or_eq_true, Bool.and_eq_true_iff,
      decide_eq_true_eq] at hs
    rcases hs with h | h
    · have hp : 0 < c.form.eval n m t := by simpa [Constraint.Holds, h.2] using hc
      have hw' : (0 : ℤ) < w := by exact_mod_cast h.1
      have := mul_pos hw' hp
      omega
    · have := ih htail h
      omega

/-- An exact nonnegative combination with a strict summand proves infeasibility.
The variables have no finite range. -/
theorem certificate_sound (ctx : List Constraint) (cs : Certificate) (hv : cs.Valid ctx)
    (n m t : ℤ) (hh : ∀ c ∈ ctx, c.Holds n m t) : False := by
  obtain ⟨hmem, hzero, hstrict⟩ := hv
  have hp := combined_positive cs n m t (fun wc hw => hh wc.2 (hmem wc hw)) hstrict
  rw [hzero] at hp
  simpa [Form.zero, Form.eval] using hp

end IRDCS.Linear
