import IRDCS.ShortRow

namespace IRDCS.Generated.N168
def pointWeights : List ℤ := [403820, 336699, 267475, 205391, 141556, 83354, 23401, -28811, -83127, -129701, -177138, -208963, -242940, -272593, -304909, -335296, -368135, -398903, -431621, -464012, -498950, -534661, -574871, -609651, -648212, -684882, -723581, -757113, -791724, -819195, -848770, -871204, -895850, -914048, -934051, -948359, -965572, -975646, -987823, -992860, -1000000, -1000000, -1000000, -997974, -995543, -985371, -977302, -962597, -950295, -930251, -912310, -886629, -861810, -827080, -793776, -753571, -718149, -674726, -630890, -576084, -508140, -430286, -352392, -280137, -213219, -150835, -94088, -42078, 5698, 50277, 89926, 126018, 154920, 180259, 201251, 224673, 253570, 285278, 312749, 335184, 352582, 368731, 380845, 386102, 386102, 380845, 368731, 352582, 335184, 312749, 285278, 253570, 224673, 201251, 180259, 154920, 126018, 89926, 50277, 5698, -42078, -94088, -150835, -213219, -280137, -352392, -430286, -508140, -576084, -630890, -674726, -718149, -753571, -793776, -827080, -861810, -886629, -912310, -930251, -950295, -962597, -977302, -985371, -995543, -997974, -1000000, -1000000, -1000000, -992860, -987823, -975646, -965572, -948359, -934051, -914048, -895850, -871204, -848770, -819195, -791724, -757113, -723581, -684882, -648212, -609651, -574871, -534661, -498950, -464012, -431621, -398903, -368135, -335296, -304909, -272593, -242940, -208963, -177138, -129701, -83127, -28811, 23401, 83354, 141556, 205391, 267475, 336699, 403820]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2463854, 2569709, 2494289, 2412321, 2329070, 2243363, 2159891, 2072298, 1978693, 1958990, 1917870, 1876180, 1832474, 1785611, 1729894, 1669926, 1623549, 1596842, 1581469, 1561466, 1536128, 1506446, 1471835, 1432187, 1387502, 1343904, 1322148, 1293515, 1259243, 1219333, 1175190, 1125408, 1070889, 1011837, 946547, 876520, 802259, 722962, 640875, 553453, 461794, 365099, 266844, 168432, 68886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (58 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_8 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (66 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_9 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (74 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_10 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (82 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_11 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (90 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_12 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (98 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_13 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (106 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_14 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (114 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_15 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (122 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_16 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (130 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_17 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (138 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_18 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (146 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_19 : (List.range 8).all
    (fun j => modulusCheckBool 168 A D (154 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_20 : (List.range 7).all
    (fun j => modulusCheckBool 168 A D (162 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 168) : ModulusValid 168 A D m := by
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
  exact modulusBatch_sound modulus_batch_20 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 168, A x) +
    ∑ m ∈ Finset.Icc 2 168, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 168 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 168 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 168 k)
    (hmin : ∀ i, 168 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N168
