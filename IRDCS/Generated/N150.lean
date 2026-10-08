import IRDCS.ShortRow

namespace IRDCS.Generated.N150
def pointWeights : List ℤ := [416983, 341056, 264537, 194532, 124584, 59852, -4823, -62984, -121737, -169888, -201004, -242156, -277599, -313032, -348160, -386791, -420842, -459157, -496767, -536944, -580421, -618681, -661858, -705685, -747730, -783262, -819385, -848994, -879195, -902522, -927162, -944928, -963285, -975129, -987565, -993486, -1000000, -1000000, -1000000, -994670, -989339, -976734, -965482, -947716, -930542, -906092, -882996, -847983, -812783, -771024, -729958, -683308, -634413, -569456, -480809, -392277, -310428, -234501, -164496, -100412, -42251, 9988, 56306, 96725, 132651, 159727, 184124, 210595, 242933, 278465, 308074, 331762, 349528, 363893, 370892, 370892, 363893, 349528, 331762, 308074, 278465, 242933, 210595, 184124, 159727, 132651, 96725, 56306, 9988, -42251, -100412, -164496, -234501, -310428, -392277, -480809, -569456, -634413, -683308, -729958, -771024, -812783, -847983, -882996, -906092, -930542, -947716, -965482, -976734, -989339, -994670, -1000000, -1000000, -1000000, -993486, -987565, -975129, -963285, -944928, -927162, -902522, -879195, -848994, -819385, -783262, -747730, -705685, -661858, -618681, -580421, -536944, -496767, -459157, -420842, -386791, -348160, -313032, -277599, -242156, -201004, -169888, -121737, -62984, -4823, 59852, 124584, 194532, 264537, 341056, 416983]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2474814, 2580459, 2488976, 2394561, 2298197, 2200693, 2097997, 1990870, 1983634, 1936977, 1886620, 1833178, 1771283, 1704605, 1648885, 1613758, 1595400, 1571122, 1540920, 1504797, 1462753, 1414785, 1363313, 1338257, 1303954, 1262967, 1216819, 1163989, 1105235, 1040561, 969964, 893445, 811005, 722642, 628358, 528151, 422023, 309974, 201765, 91640, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 150 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 5).all
    (fun j => modulusCheckBool 150 A D (146 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 150) : ModulusValid 150 A D m := by
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
  by_cases h6 : m < 58
  · exact modulusBatch_sound modulus_batch_6 m (by omega) h6
  by_cases h7 : m < 66
  · exact modulusBatch_sound modulus_batch_7 m (by omega) h7
  by_cases h8 : m < 74
  · exact modulusBatch_sound modulus_batch_8 m (by omega) h8
  by_cases h9 : m < 82
  · exact modulusBatch_sound modulus_batch_9 m (by omega) h9
  by_cases h10 : m < 90
  · exact modulusBatch_sound modulus_batch_10 m (by omega) h10
  by_cases h11 : m < 98
  · exact modulusBatch_sound modulus_batch_11 m (by omega) h11
  by_cases h12 : m < 106
  · exact modulusBatch_sound modulus_batch_12 m (by omega) h12
  by_cases h13 : m < 114
  · exact modulusBatch_sound modulus_batch_13 m (by omega) h13
  by_cases h14 : m < 122
  · exact modulusBatch_sound modulus_batch_14 m (by omega) h14
  by_cases h15 : m < 130
  · exact modulusBatch_sound modulus_batch_15 m (by omega) h15
  by_cases h16 : m < 138
  · exact modulusBatch_sound modulus_batch_16 m (by omega) h16
  by_cases h17 : m < 146
  · exact modulusBatch_sound modulus_batch_17 m (by omega) h17
  exact modulusBatch_sound modulus_batch_18 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 150, A x) +
    ∑ m ∈ Finset.Icc 2 150, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 150 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 150 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 150 k)
    (hmin : ∀ i, 150 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N150
