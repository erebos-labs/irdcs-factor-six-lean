import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic

namespace IRDCS
open Finset

/-- Complete intersection, including every interval member of the congruence class.
Residues need not be reduced. Positive integer moduli are represented by naturals. -/
def row (n m a : ℕ) : Finset ℕ :=
  (Icc 1 n).filter (fun x => x % m = a % m)

@[simp] theorem mem_row {n m a x : ℕ} :
    x ∈ row n m a ↔ 1 ≤ x ∧ x ≤ n ∧ x % m = a % m := by
  simp [row, and_assoc]

/-- Exactly the hypotheses of the target partition; there is no size upper bound. -/
structure TargetCover (n k : ℕ) where
  modulus : Fin k → ℕ
  residue : Fin k → ℕ
  modulus_ge_two : ∀ i, 2 ≤ modulus i
  distinct : Function.Injective modulus
  three_hits : ∀ i, 3 ≤ (row n (modulus i) (residue i)).card
  partition : ∀ x ∈ Icc 1 n, ∃! i, x ∈ row n (modulus i) (residue i)

/-- The exact goal, expressed using an attained minimum rather than a default
minimum of an empty set. This proposition is a specification, not a proved theorem. -/
def FactorSixStatement : Prop :=
  ∀ (n k : ℕ) (C : TargetCover n k) (i : Fin k),
    (∀ j, C.modulus i ≤ C.modulus j) → 6 * C.modulus i < n

/-- Integer endpoint description used by the source localization argument. -/
structure FullProgression (n : ℤ) where
  first : ℤ
  step : ℤ
  count : ℤ
  first_pos : 0 < first
  first_le_step : first ≤ step
  count_pos : 0 < count
  last_le : first + (count - 1) * step ≤ n
  next_gt : n < first + count * step

/-- General localization, with denominators cleared. Both endpoints are exact. -/
theorem localization {n : ℤ} (R : FullProgression n) (j : ℤ)
    (hj : 0 ≤ j) (hjc : j < R.count) :
    j * n ≤ R.count * (R.first + j * R.step - 1) ∧
    R.count * (R.first + j * R.step) ≤ (j + 1) * n := by
  have ht := R.first_pos
  have htm := R.first_le_step
  have hfirst : 0 ≤ R.first - 1 := by omega
  have hremain : 0 ≤ R.count - j - 1 := by omega
  have hremain' : 0 ≤ R.count - j := by omega
  have hstep : 0 ≤ R.step - R.first := by omega
  constructor
  · have hn : n ≤ R.first + R.count * R.step - 1 := by
      have := R.next_gt
      omega
    calc
      j * n ≤ j * (R.first + R.count * R.step - 1) :=
        mul_le_mul_of_nonneg_left hn hj
      _ ≤ R.count * (R.first + j * R.step - 1) := by
        nlinarith [mul_nonneg hremain' hfirst]
  · calc
      R.count * (R.first + j * R.step) ≤
          (j + 1) * (R.first + (R.count - 1) * R.step) := by
        nlinarith [mul_nonneg hremain hstep]
      _ ≤ (j + 1) * n := mul_le_mul_of_nonneg_left R.last_le (by omega)

/-- The forbidden-minimum assumption bounds every full row by six hits. -/
theorem count_le_six {n : ℤ} (R : FullProgression n)
    (hmin : n ≤ 6 * R.step) : R.count ≤ 6 := by
  have hm : 0 < R.step := lt_of_lt_of_le R.first_pos R.first_le_step
  by_contra h
  have hc : 6 ≤ R.count - 1 := by omega
  have hh := mul_le_mul_of_nonneg_right hc (le_of_lt hm)
  have hl := R.last_le
  have ht := R.first_pos
  nlinarith

end IRDCS
