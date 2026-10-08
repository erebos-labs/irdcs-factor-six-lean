import IRDCS.ShortRow

namespace IRDCS.Generated.N53
def pointWeights : List ℤ := [300810, 127828, -68055, -206199, -291279, -390655, -504511, -634976, -700393, -822299, -869489, -987647, -1000000, -1000000, -984687, -957021, -871617, -726162, -622901, -413833, -190285, -29655, 96137, 203701, 269119, 378672, 422114, 378672, 269119, 203701, 96137, -29655, -190285, -413833, -622901, -726162, -871617, -957021, -984687, -1000000, -1000000, -987647, -869489, -822299, -700393, -634976, -504511, -390655, -291279, -206199, -68055, 127828, 300810]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 2430996, 2330142, 2074486, 1900764, 1743605, 1608976, 1553180, 1431275, 1353505, 1243027, 1097710, 889475, 598334, 303447, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 53 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 4).all
    (fun j => modulusCheckBool 53 A D (50 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 53) : ModulusValid 53 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  by_cases h1 : m < 18
  · exact modulusBatch_sound modulus_batch_1 m (by omega) h1
  by_cases h2 : m < 26
  · exact modulusBatch_sound modulus_batch_2 m (by omega) h2
  by_cases h3 : m < 34
  · exact modulusBatch_sound modulus_batch_3 m (by omega) h3
  by_cases h4 : m < 42
  · exact modulusBatch_sound modulus_batch_4 m (by omega) h4
  by_cases h5 : m < 50
  · exact modulusBatch_sound modulus_batch_5 m (by omega) h5
  exact modulusBatch_sound modulus_batch_6 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 53, A x) +
    ∑ m ∈ Finset.Icc 2 53, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 53 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 53 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 53 k)
    (hmin : ∀ i, 53 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N53
