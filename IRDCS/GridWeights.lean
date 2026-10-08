import IRDCS.Generated.GridData
import IRDCS.Dual

namespace IRDCS

def binOnGrid (n x : ℕ) (b : ClosedBin) : ℤ :=
  if (n : ℤ) * b.left.num < (x : ℤ) * b.left.den ∧
      (x : ℤ) * b.right.den ≤ (n : ℤ) * b.right.num then b.weight else 0

def segmentOnGrid (n m : ℕ) (s : OpenSegment) : ℤ :=
  if (n : ℤ) * s.left.num < (m : ℤ) * s.left.den ∧
      (m : ℤ) * s.right.den < (n : ℤ) * s.right.num then s.weight else 0

def boundaryOnGrid (n m : ℕ) (a : BoundaryAtom) : ℤ :=
  if (m : ℤ) * a.endpoint.den = (n : ℤ) * a.endpoint.num then a.weight else 0

def pointWeight (n x : ℕ) : ℤ := (Generated.bins.map (binOnGrid n x)).sum
def modulusWeight (n m : ℕ) : ℤ :=
  (Generated.segments.map (segmentOnGrid n m)).sum +
    (Generated.atoms.map (boundaryOnGrid n m)).sum

theorem sum_map_nonnegative {α : Type} (xs : List α) (w : α → ℤ)
    (h : ∀ x ∈ xs, 0 ≤ w x) : 0 ≤ (xs.map w).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    have hx := h x (by simp)
    have ht := ih (fun a ha => h a (by simp [ha]))
    simp only [List.map_cons, List.sum_cons]
    omega

theorem actual_segments_nonnegative : ∀ s ∈ Generated.segments, 0 ≤ s.weight := by decide
theorem actual_atoms_nonnegative : ∀ a ∈ Generated.atoms, 0 ≤ a.weight := by decide

theorem modulusWeight_nonnegative (n m : ℕ) : 0 ≤ modulusWeight n m := by
  have hs := sum_map_nonnegative Generated.segments (segmentOnGrid n m) (by
    intro s hs
    unfold segmentOnGrid
    split_ifs
    · exact actual_segments_nonnegative s hs
    · omega)
  have ha := sum_map_nonnegative Generated.atoms (boundaryOnGrid n m) (by
    intro a ha
    unfold boundaryOnGrid
    split_ifs
    · exact actual_atoms_nonnegative a ha
    · omega)
  unfold modulusWeight
  omega

/-- Remaining obligation 1: the exact universal row inequality. The statement
has no finite bound on n and uses complete congruence intersections. -/
def UniversalRowBound : Prop :=
  ∀ n m a : ℕ, 0 < n → 2 ≤ m → n ≤ 6 * m → 3 ≤ (row n m a).card →
    0 ≤ (∑ x ∈ row n m a, pointWeight n x) + modulusWeight n m

/-- Remaining obligation 2: the exact grid-count identity for all positive lengths. -/
def GridSumIdentity : Prop :=
  ∀ n : ℕ, 0 < n →
    (∑ x ∈ Finset.Icc 1 n, pointWeight n x) +
      ∑ m ∈ Finset.Icc 1 n, modulusWeight n m = Generated.S n

end IRDCS
