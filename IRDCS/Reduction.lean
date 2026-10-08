import IRDCS.GridWeights
import IRDCS.GridCounting
import IRDCS.Generated.FirstPeriod
import IRDCS.Generated.AllExceptions

namespace IRDCS
open Finset

/-- Fully checked final reduction, with the two unproved obligations explicit.
This conditional theorem is not a proof of FactorSixStatement. -/
theorem factorSix_of_row_bound_and_grid_identity
    (hrow : UniversalRowBound) (hgrid : GridSumIdentity) : FactorSixStatement := by
  intro n k C i hsmallest
  have hn : 0 < n := by
    have hc := C.three_hits i
    have hnonempty : (row n (C.modulus i) (C.residue i)).Nonempty :=
      card_pos.mp (by omega)
    obtain ⟨x, hx⟩ := hnonempty
    obtain ⟨hxp, hxn, _⟩ := mem_row.mp hx
    omega
  by_contra hgoal
  have hmin : ∀ j, n ≤ 6 * C.modulus j := by
    intro j
    have hbase : n ≤ 6 * C.modulus i := Nat.not_lt.mp hgoal
    exact hbase.trans (Nat.mul_le_mul_left 6 (hsmallest j))
  have hM : ∀ j, C.modulus j ∈ Icc 1 n := by
    intro j
    have hm := C.modulus_ge_two j
    exact mem_Icc.mpr ⟨by omega, modulus_le_of_three_hits (C.three_hits j)⟩
  have hb := dual_nonnegative C (pointWeight n) (modulusWeight n) (Icc 1 n) hM
    (fun m _ => modulusWeight_nonnegative n m)
    (fun j => hrow n (C.modulus j) (C.residue j) hn (C.modulus_ge_two j)
      (hmin j) (C.three_hits j))
  rw [hgrid n hn] at hb
  have hexc := Generated.nonnegative_only_at_exceptions n hn hb
  exact Generated.all_exceptions_excluded n hexc C hmin

/-- The grid identity is discharged; only the universal row law remains. -/
theorem factorSix_of_row_bound (hrow : UniversalRowBound) : FactorSixStatement :=
  factorSix_of_row_bound_and_grid_identity hrow grid_sum_identity

end IRDCS
