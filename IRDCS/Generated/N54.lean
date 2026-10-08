import IRDCS.ShortRow

namespace IRDCS.Generated.N54
def pointWeights : List ℤ := [287611, 99115, -107965, -208407, -300000, -385841, -500000, -614159, -750885, -821239, -910177, -938496, -1000000, -990708, -1000000, -920354, -859292, -725664, -610619, -406637, -138496, 59292, 219469, 337611, 407965, 493805, 525221, 525221, 493805, 407965, 337611, 219469, 59292, -138496, -406637, -610619, -725664, -859292, -920354, -1000000, -990708, -1000000, -938496, -910177, -821239, -750885, -614159, -500000, -385841, -300000, -208407, -107965, 99115, 287611]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 2197346, 2173894, 1940266, 1711505, 1598230, 1465487, 1413275, 1333628, 1206195, 1166815, 1039381, 841593, 591593, 314159, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 54 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 5).all
    (fun j => modulusCheckBool 54 A D (50 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 54) : ModulusValid 54 A D m := by
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
  exact modulusBatch_sound modulus_batch_6 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 54, A x) +
    ∑ m ∈ Finset.Icc 2 54, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 54 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 54 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 54 k)
    (hmin : ∀ i, 54 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N54
