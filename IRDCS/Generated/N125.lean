import IRDCS.ShortRow

namespace IRDCS.Generated.N125
def pointWeights : List ℤ := [347348, 260424, 176328, 96663, 19826, -48619, -114199, -171592, -218700, -259177, -297257, -334988, -378923, -415936, -461277, -502663, -555459, -599820, -643517, -686782, -716868, -769871, -811808, -850915, -885593, -917441, -940899, -965489, -981688, -991060, -1000000, -1000000, -1000000, -994854, -981105, -965119, -940530, -913074, -877431, -829032, -786832, -728200, -684391, -625633, -556591, -477195, -376734, -283699, -201717, -130992, -67525, -15278, 29710, 77805, 118635, 154603, 187079, 221403, 261227, 293792, 316700, 332899, 348133, 332899, 316700, 293792, 261227, 221403, 187079, 154603, 118635, 77805, 29710, -15278, -67525, -130992, -201717, -283699, -376734, -477195, -556591, -625633, -684391, -728200, -786832, -829032, -877431, -913074, -940530, -965119, -981105, -994854, -1000000, -1000000, -1000000, -991060, -981688, -965489, -940899, -917441, -885593, -850915, -811808, -769871, -716868, -686782, -643517, -599820, -555459, -502663, -461277, -415936, -378923, -334988, -297257, -259177, -218700, -171592, -114199, -48619, 19826, 96663, 176328, 260424, 347348]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2542003, 2517449, 2433847, 2345044, 2235986, 2139459, 2019505, 1967933, 1908116, 1851047, 1780013, 1692690, 1648789, 1624366, 1591801, 1550582, 1499704, 1456439, 1403802, 1368365, 1338428, 1297438, 1245191, 1181891, 1111166, 1029387, 936352, 836057, 724543, 605770, 479738, 348554, 224528, 97870, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 125 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 4).all
    (fun j => modulusCheckBool 125 A D (122 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 125) : ModulusValid 125 A D m := by
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
  exact modulusBatch_sound modulus_batch_15 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 125, A x) +
    ∑ m ∈ Finset.Icc 2 125, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 125 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 125 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 125 k)
    (hmin : ∀ i, 125 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N125
