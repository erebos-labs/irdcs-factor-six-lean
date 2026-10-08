import IRDCS.Generated.GridData
namespace IRDCS.Generated
set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
theorem period_chunk_56 : ∀ r ∈ Finset.Icc 3361 3420,
    S r < 46105 ∧ (0 ≤ S r ↔ r ∈ exceptions) := by decide
end IRDCS.Generated
