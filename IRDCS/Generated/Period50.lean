import IRDCS.Generated.GridData
namespace IRDCS.Generated
set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
theorem period_chunk_50 : ∀ r ∈ Finset.Icc 3001 3060,
    S r < 46105 ∧ (0 ≤ S r ↔ r ∈ exceptions) := by decide
end IRDCS.Generated
