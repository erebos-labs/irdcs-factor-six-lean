import IRDCS.ShortRow

namespace IRDCS.Generated.N180
def pointWeights : List ℤ := [425328, 360935, 299382, 238984, 181425, 125021, 71457, 19047, -30523, -78668, -123973, -166574, -196396, -226405, -258141, -286422, -315634, -346592, -377989, -405872, -436304, -467025, -502206, -536232, -568129, -604394, -641499, -677352, -712408, -745782, -776317, -805697, -832238, -857624, -880170, -901561, -920113, -937510, -952068, -965471, -976034, -985442, -992011, -997425, -1000000, -1000000, -1000000, -997425, -992011, -985172, -975764, -965200, -951797, -936970, -919302, -900209, -878277, -850624, -820318, -786945, -752984, -717555, -678337, -632770, -578285, -507974, -436742, -369504, -306531, -247823, -192839, -141849, -94853, -51852, -12845, 22167, 53185, 82123, 103239, 123264, 143402, 165780, 196316, 224277, 248243, 268215, 284192, 298841, 307710, 313844, 313844, 307710, 298841, 284192, 268215, 248243, 224277, 196316, 165780, 143402, 123264, 103239, 82123, 53185, 22167, -12845, -51852, -94853, -141849, -192839, -247823, -306531, -369504, -436742, -507974, -578285, -632770, -678337, -717555, -752984, -786945, -820318, -850624, -878277, -900209, -919302, -936970, -951797, -965200, -975764, -985172, -992011, -997425, -1000000, -1000000, -1000000, -997425, -992011, -985442, -976034, -965471, -952068, -937510, -920113, -901561, -880170, -857624, -832238, -805697, -776317, -745782, -712408, -677352, -641499, -604394, -568129, -536232, -502206, -467025, -436304, -405872, -377989, -346592, -315634, -286422, -258141, -226405, -196396, -166574, -123973, -78668, -30523, 19047, 71457, 125021, 181425, 238984, 299382, 360935, 425328]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2560628, 2683179, 2602993, 2519418, 2438062, 2353194, 2267362, 2181526, 2087842, 2070844, 2035930, 1993738, 1950412, 1905615, 1853960, 1799236, 1740330, 1698433, 1669297, 1653319, 1633347, 1609381, 1581420, 1549466, 1513517, 1473573, 1430625, 1393687, 1367474, 1336997, 1302255, 1263519, 1220787, 1173792, 1122803, 1067818, 1008839, 945866, 878899, 807938, 732982, 654032, 571087, 484148, 393215, 299706, 211405, 119820, 49126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (154 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_20 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (162 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_21 : (List.range 8).all
    (fun j => modulusCheckBool 180 A D (170 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_22 : (List.range 3).all
    (fun j => modulusCheckBool 180 A D (178 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 180) : ModulusValid 180 A D m := by
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
  exact modulusBatch_sound modulus_batch_22 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 180, A x) +
    ∑ m ∈ Finset.Icc 2 180, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 180 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 180 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 180 k)
    (hmin : ∀ i, 180 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N180
