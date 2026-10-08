import IRDCS.ShortRow

namespace IRDCS.Generated.N192
def pointWeights : List ℤ := [405302, 345287, 287810, 231302, 177277, 124299, 73646, 24041, -22294, -67873, -110244, -151187, -185263, -212513, -242051, -269234, -298097, -322251, -352282, -380883, -408982, -436418, -466629, -493799, -526593, -559408, -590566, -623758, -655841, -688243, -720496, -753015, -781067, -808089, -832572, -856086, -877117, -897180, -914760, -931783, -944618, -959958, -971109, -981229, -988199, -994628, -998089, -1000000, -1000000, -1000000, -996441, -991969, -984445, -976008, -965033, -952949, -937947, -921899, -902581, -881835, -858552, -831208, -802058, -770966, -737162, -704423, -667088, -626614, -575360, -511076, -442624, -376970, -315281, -257970, -203954, -154059, -107734, -64859, -25375, 11070, 44064, 74994, 99698, 122696, 140564, 158395, 178558, 205321, 233302, 257893, 278976, 295999, 310648, 322486, 331912, 336450, 336450, 331912, 322486, 310648, 295999, 278976, 257893, 233302, 205321, 178558, 158395, 140564, 122696, 99698, 74994, 44064, 11070, -25375, -64859, -107734, -154059, -203954, -257970, -315281, -376970, -442624, -511076, -575360, -626614, -667088, -704423, -737162, -770966, -802058, -831208, -858552, -881835, -902581, -921899, -937947, -952949, -965033, -976008, -984445, -991969, -996441, -1000000, -1000000, -1000000, -998089, -994628, -988199, -981229, -971109, -959958, -944618, -931783, -914760, -897180, -877117, -856086, -832572, -808089, -781067, -753015, -720496, -688243, -655841, -623758, -590566, -559408, -526593, -493799, -466629, -436418, -408982, -380883, -352282, -322251, -298097, -269234, -242051, -212513, -185263, -151187, -110244, -67873, -22294, 24041, 73646, 124299, 177277, 231302, 287810, 345287, 405302]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2539338, 2645314, 2576415, 2503285, 2431005, 2356050, 2277895, 2202598, 2121778, 2036541, 2030943, 1992974, 1955903, 1915528, 1874639, 1827681, 1777205, 1723522, 1679412, 1649310, 1635784, 1619225, 1599270, 1575746, 1548286, 1517802, 1483321, 1445148, 1406636, 1369049, 1347424, 1321164, 1290877, 1256273, 1218374, 1176355, 1130822, 1081782, 1029291, 972443, 911687, 847541, 779882, 708833, 634745, 557206, 476215, 391717, 307872, 223736, 137964, 61326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (154 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_20 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (162 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_21 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (170 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_22 : (List.range 8).all
    (fun j => modulusCheckBool 192 A D (178 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_23 : (List.range 7).all
    (fun j => modulusCheckBool 192 A D (186 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 192) : ModulusValid 192 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 192, A x) +
    ∑ m ∈ Finset.Icc 2 192, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 192 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 192 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 192 k)
    (hmin : ∀ i, 192 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N192
