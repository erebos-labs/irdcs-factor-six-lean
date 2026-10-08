import IRDCS.ShortRow

namespace IRDCS.Generated.N144
def pointWeights : List ℤ := [377457, 297411, 222176, 149539, 79884, 12827, -49418, -107995, -161751, -206106, -241717, -278664, -314820, -350743, -388728, -425954, -465010, -503308, -546030, -586156, -625235, -669829, -714659, -757704, -794843, -829386, -859116, -888078, -912228, -933781, -952350, -968323, -981312, -991704, -997284, -1000000, -1000000, -997403, -989726, -978380, -963295, -946101, -925166, -900562, -871138, -838054, -799393, -759159, -714638, -666449, -611610, -536653, -451837, -360177, -276997, -199666, -129744, -68303, -11638, 39447, 84951, 124876, 155561, 181426, 208574, 235505, 272912, 304471, 328621, 347459, 360448, 367857, 367857, 360448, 347459, 328621, 304471, 272912, 235505, 208574, 181426, 155561, 124876, 84951, 39447, -11638, -68303, -129744, -199666, -276997, -360177, -451837, -536653, -611610, -666449, -714638, -759159, -799393, -838054, -871138, -900562, -925166, -946101, -963295, -978380, -989726, -997403, -1000000, -1000000, -997284, -991704, -981312, -968323, -952350, -933781, -912228, -888078, -859116, -829386, -794843, -757704, -714659, -669829, -625235, -586156, -546030, -503308, -465010, -425954, -388728, -350743, -314820, -278664, -241717, -206106, -161751, -107995, -49418, 12827, 79884, 149539, 222176, 297411, 377457]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2495715, 2575183, 2485708, 2390675, 2294809, 2197565, 2096894, 1989362, 1966546, 1918812, 1866569, 1810574, 1747715, 1678253, 1629404, 1605160, 1583607, 1556741, 1522199, 1482077, 1434545, 1381434, 1339310, 1310158, 1272516, 1227465, 1176565, 1117721, 1052760, 980123, 900077, 814450, 723243, 626455, 522259, 412482, 297698, 187919, 79967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 144 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 7).all
    (fun j => modulusCheckBool 144 A D (138 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 144) : ModulusValid 144 A D m := by
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
  exact modulusBatch_sound modulus_batch_17 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 144, A x) +
    ∑ m ∈ Finset.Icc 2 144, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 144 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 144 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 144 k)
    (hmin : ∀ i, 144 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N144
