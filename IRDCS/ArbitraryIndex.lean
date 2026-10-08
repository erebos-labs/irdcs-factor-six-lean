import IRDCS.Final

namespace IRDCS
open Finset
universe u

/-- No finite-family hypothesis is imposed: finiteness is derived from the
partition and the nonempty intersections. -/
structure GeneralIntegerCover (n : ℕ) (I : Type u) where
  modulus : I → ℤ
  residue : I → ℤ
  modulus_ge_two : ∀ i, 2 ≤ modulus i
  distinct : Function.Injective modulus
  three_hits : ∀ i, 3 ≤ (integerRow n (modulus i) (residue i)).card
  partition : ∀ x ∈ Icc 1 n, ∃! i, x ∈ integerRow n (modulus i) (residue i)

theorem GeneralIntegerCover.index_finite {n : ℕ} {I : Type u} (C : GeneralIntegerCover n I) : Finite I := by
  classical
  have hnonempty (i : I) : ∃ x : ℕ, x ∈ integerRow n (C.modulus i) (C.residue i) := by
    apply card_pos.mp
    have := C.three_hits i
    omega
  choose point hpoint using hnonempty
  have hbound (i : I) : 1 ≤ point i ∧ point i ≤ n := by
    have hx := hpoint i
    exact mem_Icc.mp (mem_filter.mp hx).1
  let f : I → Fin (n + 1) := fun i => ⟨point i, by have := hbound i; omega⟩
  have hf : Function.Injective f := by
    intro i j hij
    have hp : point i = point j := congrArg Fin.val hij
    obtain ⟨a, ha, hu⟩ := C.partition (point i) (mem_Icc.mpr (hbound i))
    have hi := hu i (hpoint i)
    have hj := hu j (by rw [hp]; exact hpoint j)
    exact hi.trans hj.symm
  exact Finite.of_injective f hf

/-- Exact factor-six theorem for an arbitrary indexing type. The theorem itself
has no finiteness or size-bound premise. -/
theorem factorSix_arbitrary_index {n : ℕ} {I : Type u} (C : GeneralIntegerCover n I) (i : I)
    (hmin : ∀ j, C.modulus i ≤ C.modulus j) : 6 * C.modulus i < (n : ℤ) := by
  classical
  letI : Finite I := C.index_finite
  letI : Fintype I := Fintype.ofFinite I
  let e : I ≃ Fin (Fintype.card I) := Fintype.equivFin I
  let D : IntegerCover n (Fintype.card I) := {
    modulus := fun j => C.modulus (e.symm j)
    residue := fun j => C.residue (e.symm j)
    modulus_ge_two := fun j => C.modulus_ge_two (e.symm j)
    distinct := by
      intro j k h
      exact e.symm.injective (C.distinct h)
    three_hits := fun j => C.three_hits (e.symm j)
    partition := by
      intro x hx
      obtain ⟨j, hj, hu⟩ := C.partition x hx
      refine ⟨e j, by simpa using hj, ?_⟩
      intro k hk
      have hk' : e.symm k = j := hu (e.symm k) hk
      simpa using congrArg e hk'
  }
  have hs : ∀ j, D.modulus (e i) ≤ D.modulus j := by
    intro j
    simpa [D] using hmin (e.symm j)
  have h := factorSix_integer n (Fintype.card I) D (e i) hs
  simpa [D] using h

end IRDCS
