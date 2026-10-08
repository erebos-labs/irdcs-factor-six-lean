import IRDCS.ShortRow

namespace IRDCS.Generated.N35
def pointWeights : List ℤ := [206373, -62215, -258725, -383156, -574734, -689302, -798938, -939681, -972307, -1000000, -893399, -611533, -401745, -26555, 209408, 368361, 450303, 558422, 450303, 368361, 209408, -26555, -401745, -611533, -893399, -1000000, -972307, -939681, -798938, -689302, -574734, -383156, -258725, -62215, 206373]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 2043248, 1994689, 1566009, 1386192, 1320942, 1178680, 1088771, 792489, 383157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 35 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 35 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 35 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 35 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 2).all
    (fun j => modulusCheckBool 35 A D (34 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 35) : ModulusValid 35 A D m := by
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
  exact modulusBatch_sound modulus_batch_4 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 35, A x) +
    ∑ m ∈ Finset.Icc 2 35, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 35 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 35 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 35 k)
    (hmin : ∀ i, 35 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N35
