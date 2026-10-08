import IRDCS.ShortRow

namespace IRDCS.Generated.N60
def pointWeights : List ℤ := [287040, 142772, -55373, -155941, -266687, -355582, -444478, -501347, -645615, -714157, -836576, -861419, -940138, -943131, -1000000, -959294, -972463, -888057, -857528, -761449, -675546, -458545, -229871, -44897, 96378, 215804, 291529, 345406, 410955, 454654, 454654, 410955, 345406, 291529, 215804, 96378, -44897, -229871, -458545, -675546, -761449, -857528, -888057, -972463, -959294, -1000000, -943131, -940138, -861419, -836576, -714157, -645615, -501347, -444478, -355582, -266687, -155941, -55373, 142772, 287040]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2269381, 2311285, 2090991, 1828494, 1765640, 1648908, 1488477, 1450464, 1368752, 1243341, 1173301, 1059564, 902126, 700988, 478001, 211314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 60 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 3).all
    (fun j => modulusCheckBool 60 A D (58 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 60) : ModulusValid 60 A D m := by
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
  exact modulusBatch_sound modulus_batch_7 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 60, A x) +
    ∑ m ∈ Finset.Icc 2 60, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 60 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 60 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 60 k)
    (hmin : ∀ i, 60 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N60
