import IRDCS.Basic

namespace IRDCS
open Finset

/-- Arbitrary integer residues normalize into the natural-residue representation.
The definition of TargetCover therefore does not restrict the integer residue. -/
theorem row_of_integer_residue (n m : ℕ) (a : ℤ) (hm : 0 < m) :
    (Icc 1 n).filter (fun (x : ℕ) => (x : ℤ) % (m : ℤ) = a % (m : ℤ)) =
      row n m (a % (m : ℤ)).toNat := by
  have hm' : (0 : ℤ) < m := by exact_mod_cast hm
  have ha0 : 0 ≤ a % (m : ℤ) := Int.emod_nonneg _ (ne_of_gt hm')
  have haM : a % (m : ℤ) < m := Int.emod_lt_of_pos _ hm'
  have haCast : ((a % (m : ℤ)).toNat : ℤ) = a % (m : ℤ) := Int.toNat_of_nonneg ha0
  have haNat : (a % (m : ℤ)).toNat < m := by exact_mod_cast (haCast ▸ haM)
  ext x
  simp only [row, mem_filter, mem_Icc, Nat.mod_eq_of_lt haNat]
  rw [← haCast, ← Int.natCast_mod, Int.natCast_inj]
  simp [max_eq_left ha0]

end IRDCS
