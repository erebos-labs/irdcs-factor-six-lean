import IRDCS.Periodic

namespace IRDCS

structure Endpoint where
  num : ℤ
  den : ℤ
  deriving DecidableEq, Repr

def floorAt (n : ℤ) (e : Endpoint) : ℤ := n * e.num / e.den
def ceilAt (n : ℤ) (e : Endpoint) : ℤ := -floorAt (-n) e
def atomAt (n : ℤ) (e : Endpoint) (w : ℤ) : ℤ :=
  if n * e.num % e.den = 0 then w else 0

theorem floorAt_shift (n P : ℤ) (e : Endpoint) (h : e.den ∣ P) :
    floorAt (n + P) e = floorAt n e + floorAt P e := by
  unfold floorAt
  rw [add_mul, Int.add_ediv_of_dvd_right (dvd_mul_of_dvd_left h e.num)]

theorem atomAt_shift (n P : ℤ) (e : Endpoint) (w : ℤ) (h : e.den ∣ P) :
    atomAt (n + P) e w = atomAt n e w := by
  obtain ⟨q, hq⟩ := h
  unfold atomAt
  have heq : (n + P) * e.num % e.den = n * e.num % e.den := by
    rw [hq]
    have heq' : (n + e.den * q) * e.num = n * e.num + (q * e.num) * e.den := by ring
    rw [heq', Int.add_mul_emod_self]
  rw [heq]

structure OpenSegment where
  left : Endpoint
  right : Endpoint
  weight : ℤ
  deriving Repr

structure ClosedBin where
  left : Endpoint
  right : Endpoint
  weight : ℤ
  deriving Repr

structure BoundaryAtom where
  endpoint : Endpoint
  weight : ℤ
  deriving Repr

def openValue (n : ℤ) (s : OpenSegment) : ℤ :=
  s.weight * (ceilAt n s.right - floorAt n s.left - 1)
def binValue (n : ℤ) (s : ClosedBin) : ℤ :=
  s.weight * (floorAt n s.right - floorAt n s.left)
def boundaryValue (n : ℤ) (s : BoundaryAtom) : ℤ := atomAt n s.endpoint s.weight
def openDrift (P : ℤ) (s : OpenSegment) : ℤ :=
  s.weight * (floorAt P s.right - floorAt P s.left)
def binDrift (P : ℤ) (s : ClosedBin) : ℤ :=
  s.weight * (floorAt P s.right - floorAt P s.left)

theorem ceilAt_shift (n P : ℤ) (e : Endpoint) (h : e.den ∣ P) :
    ceilAt (n + P) e = ceilAt n e + floorAt P e := by
  obtain ⟨q, hq⟩ := h
  unfold ceilAt floorAt
  have hneg : -(n + P) * e.num = -n * e.num + (-q * e.num) * e.den := by
    rw [hq]
    ring
  have hp : P * e.num = (q * e.num) * e.den := by rw [hq]; ring
  by_cases hd : e.den = 0
  · simp [hd]
  · rw [hneg, hp, Int.add_mul_ediv_right _ _ hd, Int.mul_ediv_cancel _ hd]
    ring

theorem openValue_shift (n P : ℤ) (s : OpenSegment)
    (hl : s.left.den ∣ P) (hr : s.right.den ∣ P) :
    openValue (n + P) s = openValue n s + openDrift P s := by
  unfold openValue openDrift
  rw [ceilAt_shift n P s.right hr, floorAt_shift n P s.left hl]
  ring

theorem binValue_shift (n P : ℤ) (s : ClosedBin)
    (hl : s.left.den ∣ P) (hr : s.right.den ∣ P) :
    binValue (n + P) s = binValue n s + binDrift P s := by
  unfold binValue binDrift
  rw [floorAt_shift n P s.right hr, floorAt_shift n P s.left hl]
  ring

def gridTotal (bins : List ClosedBin) (segs : List OpenSegment)
    (atoms : List BoundaryAtom) (n : ℤ) : ℤ :=
  (bins.map (binValue n)).sum + (segs.map (openValue n)).sum +
    (atoms.map (boundaryValue n)).sum

theorem sum_map_shift {α : Type} (xs : List α) (f g d : α → ℤ)
    (h : ∀ x ∈ xs, f x = g x + d x) :
    (xs.map f).sum = (xs.map g).sum + (xs.map d).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    have hx := h x (by simp)
    have ht := ih (fun a ha => h a (by simp [ha]))
    simp only [List.map_cons, List.sum_cons]
    rw [hx, ht]
    ring

/-- Universal periodicity follows from endpoint divisibility, not sampled periods. -/
theorem gridTotal_shift (bins : List ClosedBin) (segs : List OpenSegment)
    (atoms : List BoundaryAtom) (P n : ℤ)
    (hb : ∀ b ∈ bins, b.left.den ∣ P ∧ b.right.den ∣ P)
    (hs : ∀ s ∈ segs, s.left.den ∣ P ∧ s.right.den ∣ P)
    (ha : ∀ a ∈ atoms, a.endpoint.den ∣ P) :
    gridTotal bins segs atoms (n + P) = gridTotal bins segs atoms n +
      (bins.map (binDrift P)).sum + (segs.map (openDrift P)).sum := by
  have hbins := sum_map_shift bins (binValue (n + P)) (binValue n) (binDrift P)
    (fun b h => binValue_shift n P b (hb b h).1 (hb b h).2)
  have hsegs := sum_map_shift segs (openValue (n + P)) (openValue n) (openDrift P)
    (fun s h => openValue_shift n P s (hs s h).1 (hs s h).2)
  have hatoms : (atoms.map (boundaryValue (n + P))).sum =
      (atoms.map (boundaryValue n)).sum := by
    congr 1
    apply List.map_congr_left
    intro a h
    exact atomAt_shift n P a.endpoint a.weight (ha a h)
  unfold gridTotal
  rw [hbins, hsegs, hatoms]
  ring

end IRDCS
