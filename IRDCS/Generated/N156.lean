import IRDCS.ShortRow

namespace IRDCS.Generated.N156
def pointWeights : List ℤ := [423754, 350746, 278484, 210858, 143978, 81638, 20140, -36818, -92934, -144510, -184823, -218748, -252590, -286719, -321226, -356117, -390634, -425996, -462244, -499531, -538940, -580599, -625694, -665940, -707537, -745752, -782198, -814104, -845167, -871885, -897857, -918998, -939588, -955444, -970554, -981125, -990853, -996042, -1000000, -1000000, -999255, -993679, -987357, -973489, -964695, -948452, -931366, -909740, -886707, -855158, -822430, -784206, -745420, -701333, -654770, -599100, -527255, -443289, -364705, -291504, -223587, -161150, -103998, -52229, -5841, 35261, 71549, 101415, 126274, 148059, 175530, 210897, 243384, 270102, 291437, 307680, 321245, 329333, 329333, 321245, 307680, 291437, 270102, 243384, 210897, 175530, 148059, 126274, 101415, 71549, 35261, -5841, -52229, -103998, -161150, -223587, -291504, -364705, -443289, -527255, -599100, -654770, -701333, -745420, -784206, -822430, -855158, -886707, -909740, -931366, -948452, -964695, -973489, -987357, -993679, -999255, -1000000, -1000000, -996042, -990853, -981125, -970554, -955444, -939588, -918998, -897857, -871885, -845167, -814104, -782198, -745752, -707537, -665940, -625694, -580599, -538940, -499531, -462244, -425996, -390634, -356117, -321226, -286719, -252590, -218748, -184823, -144510, -92934, -36818, 20140, 81638, 143978, 210858, 278484, 350746, 423754]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2538502, 2650780, 2554548, 2459582, 2363837, 2261137, 2161898, 2055153, 2047739, 2001750, 1953638, 1901874, 1845490, 1783733, 1717745, 1674074, 1648152, 1627950, 1602462, 1571302, 1534856, 1493221, 1446206, 1395922, 1367380, 1332890, 1293017, 1247763, 1197223, 1141205, 1079901, 1013214, 941145, 863792, 780959, 692840, 599340, 500360, 396191, 288562, 180023, 75856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 156 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 3).all
    (fun j => modulusCheckBool 156 A D (154 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 156) : ModulusValid 156 A D m := by
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
  exact modulusBatch_sound modulus_batch_19 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 156, A x) +
    ∑ m ∈ Finset.Icc 2 156, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 156 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 156 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 156 k)
    (hmin : ∀ i, 156 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N156
