import IRDCS.GridCounting
import IRDCS.Generated.PointTable

namespace IRDCS
open Finset

def uniformBin (n x j : ℕ) : Prop :=
  (j : ℤ) * n < 60 * (x : ℤ) ∧ 60 * (x : ℤ) ≤ ((j : ℤ) + 1) * n

instance (n x j : ℕ) : Decidable (uniformBin n x j) := by unfold uniformBin; infer_instance

theorem uniformBin_unique {n x j k : ℕ} (hn : 0 < n)
    (hj : uniformBin n x j) (hk : uniformBin n x k) : j = k := by
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  unfold uniformBin at hj hk
  by_contra h
  rcases lt_or_gt_of_ne h with h | h
  · have h' : (j : ℤ) + 1 ≤ k := by omega
    have := mul_le_mul_of_nonneg_right h' hn'.le
    omega
  · have h' : (k : ℤ) + 1 ≤ j := by omega
    have := mul_le_mul_of_nonneg_right h' hn'.le
    omega

theorem uniformBin_exists_below {n x N : ℕ} (hn : 0 < n) (hx : 0 < x)
    (hN : 60 * x ≤ N * n) : ∃ j < N, uniformBin n x j := by
  let q : ℤ := (60 * (x : ℤ) - 1) / n
  have hn' : (0 : ℤ) < n := by exact_mod_cast hn
  have hq : 0 ≤ q := (Int.le_ediv_iff_mul_le hn').mpr (by omega)
  have hNi : 60 * (x : ℤ) ≤ (N : ℤ) * n := by exact_mod_cast hN
  have hqN : q < N := (Int.ediv_lt_iff_lt_mul hn').mpr (by omega)
  have hcast : (q.toNat : ℤ) = q := Int.toNat_of_nonneg hq
  refine ⟨q.toNat, by omega, ?_⟩
  have hl : q * n ≤ 60 * (x : ℤ) - 1 := (Int.le_ediv_iff_mul_le hn').mp le_rfl
  have hr : 60 * (x : ℤ) - 1 < (q + 1) * n :=
    (Int.ediv_lt_iff_lt_mul hn').mp (by change q < q + 1; omega)
  unfold uniformBin
  rw [hcast]
  omega

theorem pointWeight_of_uniformBin {n x j : ℕ} (hn : 0 < n) (hj : j < 60)
    (hbin : uniformBin n x j) : pointWeight n x = Generated.pointTable.getD j 0 := by
  unfold pointWeight
  rw [Generated.bins_as_uniform, List.map_map]
  have heq : (fun k : ℕ => binOnGrid n x
      ⟨⟨k, 60⟩, ⟨k + 1, 60⟩, Generated.pointTable.getD k 0⟩) =
      (fun k => if k = j then Generated.pointTable.getD j 0 else 0) := by
    funext k
    by_cases hk : k = j
    · subst k
      have hcond : (n : ℤ) * j < (x : ℤ) * 60 ∧
          (x : ℤ) * 60 ≤ (n : ℤ) * ((j : ℤ) + 1) := by
        simpa only [uniformBin, mul_comm] using hbin
      simp [binOnGrid, hcond]
    · have hnot : ¬uniformBin n x k := fun h => hk (uniformBin_unique hn h hbin)
      have hcond : ¬((n : ℤ) * k < (x : ℤ) * 60 ∧
          (x : ℤ) * 60 ≤ (n : ℤ) * ((k : ℤ) + 1)) := by
        simpa only [uniformBin, mul_comm] using hnot
      simp only [binOnGrid, hcond, if_false, if_neg hk]
  change ((List.range 60).map (fun k : ℕ => binOnGrid n x
      ⟨⟨k, 60⟩, ⟨k + 1, 60⟩, Generated.pointTable.getD k 0⟩)).sum = _
  rw [heq]
  have hsum : (∑ k ∈ range 60, if k = j then Generated.pointTable.getD j 0 else 0) =
      Generated.pointTable.getD j 0 := by simp [hj]
  have hrange : (List.range 60).toFinset = range 60 := by ext k; simp
  rw [← List.sum_toFinset _ List.nodup_range, hrange]
  exact hsum

theorem pointWeight_outside {n x : ℕ} (hx : n < x) : pointWeight n x = 0 := by
  unfold pointWeight
  apply List.sum_eq_zero
  intro w hw
  obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hw
  obtain ⟨_, hr, _⟩ := actual_bin_endpoints b hb
  unfold binOnGrid
  have hnot : ¬((n : ℤ) * b.left.num < (x : ℤ) * b.left.den ∧
      (x : ℤ) * b.right.den ≤ (n : ℤ) * b.right.num) := by
    intro h
    have hn : (0 : ℤ) ≤ n := by omega
    have hbound := mul_le_mul_of_nonneg_left hr.2.2 hn
    have hstrict := mul_lt_mul_of_pos_right (show (n : ℤ) < x by omega) hr.1
    nlinarith
  simp [hnot]

end IRDCS
