import IRDCS.FiniteCover

namespace IRDCS
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked_eleven_bool :
    (candidateList 11).sublists.all (fun L => !decide (SelectionValid 11 L.toFinset)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked_twelve_bool :
    (candidateList 12).sublists.all (fun L => !decide (SelectionValid 12 L.toFinset)) = true := by decide

theorem checked_eleven : ∀ S ∈ (candidates 11).powerset, ¬ SelectionValid 11 S := by
  exact list_exhaustion_sound 11 checked_eleven_bool

theorem checked_twelve : ∀ S ∈ (candidates 12).powerset, ¬ SelectionValid 12 S := by
  exact list_exhaustion_sound 12 checked_twelve_bool
end IRDCS
