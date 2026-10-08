import IRDCS.IntegerResidues
import IRDCS.Reduction

namespace IRDCS
open Finset

def integerRow (n : ℕ) (m a : ℤ) : Finset ℕ :=
  (Icc 1 n).filter (fun x => (x : ℤ) % m = a % m)

/-- The requested cover hypotheses with integer moduli and integer residues. -/
structure IntegerCover (n k : ℕ) where
  modulus : Fin k → ℤ
  residue : Fin k → ℤ
  modulus_ge_two : ∀ i, 2 ≤ modulus i
  distinct : Function.Injective modulus
  three_hits : ∀ i, 3 ≤ (integerRow n (modulus i) (residue i)).card
  partition : ∀ x ∈ Icc 1 n, ∃! i, x ∈ integerRow n (modulus i) (residue i)

def IntegerFactorSixStatement : Prop :=
  ∀ n k (C : IntegerCover n k) (i : Fin k),
    (∀ j, C.modulus i ≤ C.modulus j) → 6 * C.modulus i < (n : ℤ)

theorem integerRow_eq_naturalRow (n : ℕ) (m a : ℤ) (hm : 2 ≤ m) :
    integerRow n m a = row n m.toNat (a % m).toNat := by
  have hcast : (m.toNat : ℤ) = m := Int.toNat_of_nonneg (by omega)
  have hmnat : 0 < m.toNat := by omega
  have h := row_of_integer_residue n m.toNat a hmnat
  simpa only [hcast, integerRow] using h

def IntegerCover.toTarget {n k : ℕ} (C : IntegerCover n k) : TargetCover n k where
  modulus i := (C.modulus i).toNat
  residue i := (C.residue i % C.modulus i).toNat
  modulus_ge_two i := by have := C.modulus_ge_two i; omega
  distinct := by
    intro i j hij
    apply C.distinct
    have hi : ((C.modulus i).toNat : ℤ) = C.modulus i :=
      Int.toNat_of_nonneg (by have := C.modulus_ge_two i; omega)
    have hj : ((C.modulus j).toNat : ℤ) = C.modulus j :=
      Int.toNat_of_nonneg (by have := C.modulus_ge_two j; omega)
    exact hi.symm.trans ((congrArg (fun x : ℕ => (x : ℤ)) hij).trans hj)
  three_hits i := by
    rw [← integerRow_eq_naturalRow n (C.modulus i) (C.residue i) (C.modulus_ge_two i)]
    exact C.three_hits i
  partition x hx := by
    have hrows (i : Fin k) := integerRow_eq_naturalRow n (C.modulus i) (C.residue i) (C.modulus_ge_two i)
    simpa only [hrows] using C.partition x hx

theorem integerFactorSix_of_naturalFactorSix (h : FactorSixStatement) : IntegerFactorSixStatement := by
  intro n k C i hmin
  have hsmallest : ∀ j, C.toTarget.modulus i ≤ C.toTarget.modulus j := by
    intro j
    exact Int.toNat_le_toNat (hmin j)
  have hh := h n k C.toTarget i hsmallest
  have hi : ((C.modulus i).toNat : ℤ) = C.modulus i :=
    Int.toNat_of_nonneg (by have := C.modulus_ge_two i; omega)
  change 6 * (C.modulus i).toNat < n at hh
  rw [← hi]
  exact_mod_cast hh

end IRDCS
