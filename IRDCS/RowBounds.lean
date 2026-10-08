import IRDCS.ShortRow

namespace IRDCS
open Finset

theorem firstRep_le {m a : ℕ} (hm : 0 < m) : firstRep m a ≤ m := by
  unfold firstRep
  split_ifs
  · rfl
  · exact (Nat.mod_lt a hm).le

/-- The cardinality upper bound for the actual complete intersection. -/
theorem row_card_le_six {n m a : ℕ} (hm : 0 < m) (hn : n ≤ 6 * m) :
    (row n m a).card ≤ 6 := by
  rw [row_eq_shortRow hm hn]
  unfold shortRow
  calc
    _ ≤ ((range 6).image (fun j => firstRep m a + j * m)).card := card_filter_le _ _
    _ ≤ (range 6).card := card_image_le
    _ = 6 := card_range 6

/-- At least three members forces the third canonical progression member into
the interval; this does not assume arbitrary truncated progressions are full. -/
theorem third_member_le {n m a : ℕ} (hm : 0 < m) (hn : n ≤ 6 * m)
    (hc : 3 ≤ (row n m a).card) : firstRep m a + 2 * m ≤ n := by
  by_contra hthird
  have hsub : shortRow n m a ⊆ (range 2).image (fun j => firstRep m a + j * m) := by
    intro x hx
    obtain ⟨hximage, hxn⟩ := mem_filter.mp hx
    obtain ⟨j, _, rfl⟩ := mem_image.mp hximage
    have hj : j < 2 := by
      by_contra h
      have hmul := Nat.mul_le_mul_right m (Nat.not_lt.mp h)
      omega
    exact mem_image.mpr ⟨j, mem_range.mpr hj, rfl⟩
  have hcard : (shortRow n m a).card ≤ 2 := by
    calc
      _ ≤ ((range 2).image (fun j => firstRep m a + j * m)).card := card_le_card hsub
      _ ≤ (range 2).card := card_image_le
      _ = 2 := card_range 2
  rw [row_eq_shortRow hm hn] at hc
  omega

theorem twice_modulus_lt_length {n m a : ℕ} (hm : 0 < m) (hn : n ≤ 6 * m)
    (hc : 3 ≤ (row n m a).card) : 2 * m < n := by
  have ht := third_member_le hm hn hc
  have hp := firstRep_pos (a := a) hm
  omega

end IRDCS
