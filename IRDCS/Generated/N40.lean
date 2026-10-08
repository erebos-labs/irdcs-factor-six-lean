import IRDCS.ShortRow

namespace IRDCS.Generated.N40
def pointWeights : List ℤ := [212457, -33244, -242262, -377149, -497898, -623615, -795185, -897593, -985862, -1000000, -1000000, -903324, -662591, -486817, -306076, 36301, 267864, 411158, 531143, 619412, 619412, 531143, 411158, 267864, 36301, -306076, -486817, -662591, -903324, -1000000, -1000000, -985862, -897593, -795185, -623615, -497898, -377149, -242262, -33244, 212457]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 1948796, 1821551, 1559420, 1391288, 1366450, 1264043, 1109285, 996943, 751242, 417272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 40 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 40 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 40 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 40 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 7).all
    (fun j => modulusCheckBool 40 A D (34 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 40) : ModulusValid 40 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 40, A x) +
    ∑ m ∈ Finset.Icc 2 40, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 40 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 40 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 40 k)
    (hmin : ∀ i, 40 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N40
