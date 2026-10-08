import IRDCS.ShortRow

namespace IRDCS.Generated.N186
def pointWeights : List ℤ := [413514, 353825, 290298, 234446, 177935, 122741, 66889, 18712, -33071, -77393, -124877, -164285, -195082, -222995, -252160, -281390, -310619, -337899, -369105, -398334, -428971, -458291, -490244, -520881, -554152, -586796, -620099, -654636, -689705, -723362, -758245, -785107, -815806, -838830, -865692, -884879, -907903, -923252, -942439, -953951, -969301, -976976, -988488, -992325, -1000000, -1000000, -1000000, -1000000, -1000000, -992325, -988488, -976515, -968608, -953258, -941496, -922059, -905784, -881434, -860089, -830047, -802527, -767395, -736037, -696913, -660310, -614716, -559932, -493413, -421750, -354136, -290377, -230920, -174625, -123303, -75126, -30786, 9717, 46382, 79210, 109517, 133353, 154669, 172147, 194696, 219253, 249952, 276814, 299838, 319025, 334375, 346342, 355343, 359367, 359367, 355343, 346342, 334375, 319025, 299838, 276814, 249952, 219253, 194696, 172147, 154669, 133353, 109517, 79210, 46382, 9717, -30786, -75126, -123303, -174625, -230920, -290377, -354136, -421750, -493413, -559932, -614716, -660310, -696913, -736037, -767395, -802527, -830047, -860089, -881434, -905784, -922059, -941496, -953258, -968608, -976515, -988488, -992325, -1000000, -1000000, -1000000, -1000000, -1000000, -992325, -988488, -976976, -969301, -953951, -942439, -923252, -907903, -884879, -865692, -838830, -815806, -785107, -758245, -723362, -689705, -654636, -620099, -586796, -554152, -520881, -490244, -458291, -428971, -398334, -369105, -337899, -310619, -281390, -252160, -222995, -195082, -164285, -124877, -77393, -33071, 18712, 66889, 122741, 177935, 234446, 290298, 353825, 413514]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2509817, 2623622, 2548643, 2471717, 2394011, 2315383, 2235915, 2154195, 2068938, 2024465, 2001790, 1964290, 1924270, 1881729, 1835443, 1785381, 1731419, 1681392, 1646499, 1623414, 1608065, 1588878, 1565854, 1538992, 1508293, 1473757, 1435383, 1393172, 1360447, 1337313, 1309266, 1276921, 1240506, 1200696, 1156374, 1108197, 1056414, 1000562, 940873, 877346, 809981, 738780, 663741, 584865, 502151, 415600, 325211, 236715, 148250, 61103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (154 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_20 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (162 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_21 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (170 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_22 : (List.range 8).all
    (fun j => modulusCheckBool 186 A D (178 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_23 : (List.range 1).all
    (fun j => modulusCheckBool 186 A D (186 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 186) : ModulusValid 186 A D m := by
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
  by_cases h18 : m < 154
  · exact modulusBatch_sound modulus_batch_18 m (by omega) h18
  by_cases h19 : m < 162
  · exact modulusBatch_sound modulus_batch_19 m (by omega) h19
  by_cases h20 : m < 170
  · exact modulusBatch_sound modulus_batch_20 m (by omega) h20
  by_cases h21 : m < 178
  · exact modulusBatch_sound modulus_batch_21 m (by omega) h21
  by_cases h22 : m < 186
  · exact modulusBatch_sound modulus_batch_22 m (by omega) h22
  exact modulusBatch_sound modulus_batch_23 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 186, A x) +
    ∑ m ∈ Finset.Icc 2 186, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 186 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 186 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 186 k)
    (hmin : ∀ i, 186 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N186
