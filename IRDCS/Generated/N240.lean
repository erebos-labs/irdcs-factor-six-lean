import IRDCS.ShortRow

namespace IRDCS.Generated.N240
def pointWeights : List ℤ := [425818, 378916, 330148, 285543, 239044, 196635, 154737, 112250, 70216, 32344, -7393, -42881, -80233, -113336, -147112, -172593, -195414, -218222, -240194, -262543, -285479, -308381, -328987, -351642, -375310, -397745, -419881, -443388, -466609, -491589, -516058, -541950, -567332, -593303, -620070, -645808, -672550, -698645, -724625, -749947, -774736, -795334, -817826, -836126, -856291, -872245, -890292, -904112, -919813, -931436, -944771, -954223, -965473, -972560, -981541, -986330, -992985, -995477, -999834, -1000000, -1000000, -1000000, -1000000, -995750, -993365, -986731, -981930, -973007, -965891, -954908, -945521, -931884, -920113, -903923, -888407, -868505, -848812, -825351, -803218, -776828, -752795, -725227, -698485, -666431, -634921, -596036, -548273, -492656, -439070, -387562, -338269, -291698, -247499, -205377, -165640, -128122, -92800, -59805, -29020, -417, 25887, 49996, 72649, 91602, 108639, 123571, 137887, 154403, 171832, 191944, 214494, 234926, 253061, 268869, 282380, 293723, 303591, 311905, 317032, 319705, 319705, 317032, 311905, 303591, 293723, 282380, 268869, 253061, 234926, 214494, 191944, 171832, 154403, 137887, 123571, 108639, 91602, 72649, 49996, 25887, -417, -29020, -59805, -92800, -128122, -165640, -205377, -247499, -291698, -338269, -387562, -439070, -492656, -548273, -596036, -634921, -666431, -698485, -725227, -752795, -776828, -803218, -825351, -848812, -868505, -888407, -903923, -920113, -931884, -945521, -954908, -965891, -973007, -981930, -986731, -993365, -995750, -1000000, -1000000, -1000000, -1000000, -999834, -995477, -992985, -986330, -981541, -972560, -965473, -954223, -944771, -931436, -919813, -904112, -890292, -872245, -856291, -836126, -817826, -795334, -774736, -749947, -724625, -698645, -672550, -645808, -620070, -593303, -567332, -541950, -516058, -491589, -466609, -443388, -419881, -397745, -375310, -351642, -328987, -308381, -285479, -262543, -240194, -218222, -195414, -172593, -147112, -113336, -80233, -42881, -7393, 32344, 70216, 112250, 154737, 196635, 239044, 285543, 330148, 378916, 425818]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2555198, 2683611, 2627323, 2567831, 2506895, 2446441, 2385384, 2321958, 2259672, 2195762, 2129318, 2059981, 2064874, 2035658, 2005184, 1973338, 1940616, 1907072, 1869547, 1830640, 1788750, 1745506, 1711235, 1683330, 1662567, 1651116, 1637547, 1621632, 1603390, 1582900, 1560242, 1535287, 1508006, 1478427, 1446849, 1414456, 1389305, 1371718, 1350556, 1326839, 1300739, 1272341, 1241623, 1208521, 1173033, 1135515, 1095671, 1053569, 1009002, 962149, 913028, 861638, 808052, 752198, 694088, 633769, 571195, 506396, 439328, 369933, 300679, 232810, 165020, 98142, 48302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (154 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_20 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (162 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_21 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (170 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_22 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (178 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_23 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (186 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_24 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (194 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_25 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (202 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_26 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (210 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_27 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (218 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_28 : (List.range 8).all
    (fun j => modulusCheckBool 240 A D (226 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_29 : (List.range 7).all
    (fun j => modulusCheckBool 240 A D (234 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 240) : ModulusValid 240 A D m := by
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
  by_cases h23 : m < 194
  · exact modulusBatch_sound modulus_batch_23 m (by omega) h23
  by_cases h24 : m < 202
  · exact modulusBatch_sound modulus_batch_24 m (by omega) h24
  by_cases h25 : m < 210
  · exact modulusBatch_sound modulus_batch_25 m (by omega) h25
  by_cases h26 : m < 218
  · exact modulusBatch_sound modulus_batch_26 m (by omega) h26
  by_cases h27 : m < 226
  · exact modulusBatch_sound modulus_batch_27 m (by omega) h27
  by_cases h28 : m < 234
  · exact modulusBatch_sound modulus_batch_28 m (by omega) h28
  exact modulusBatch_sound modulus_batch_29 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 240, A x) +
    ∑ m ∈ Finset.Icc 2 240, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 240 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 240 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 240 k)
    (hmin : ∀ i, 240 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N240
