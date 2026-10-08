import IRDCS.Generated.CompleteCompactRowTree
import IRDCS.IntegerStatement

namespace IRDCS

/-- Unconditional factor-six obstruction for full congruence-class partitions. -/
theorem factorSix : FactorSixStatement :=
  factorSix_of_row_bound Generated.compact_universal_row_bound

/-- Exact integer-modulus and integer-residue version of the requested theorem. -/
theorem factorSix_integer : IntegerFactorSixStatement :=
  integerFactorSix_of_naturalFactorSix factorSix

end IRDCS
