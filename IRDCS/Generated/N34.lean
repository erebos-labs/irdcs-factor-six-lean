import IRDCS.ShortRow

namespace IRDCS.Generated.N34
def pointWeights : List ℤ := [217391, -43478, -217391, -391304, -521739, -652174, -913043, -1000000, -1000000, -1000000, -913043, -695652, -391304, -130435, 43478, 173913, 434783, 434783, 173913, 43478, -130435, -391304, -695652, -913043, -1000000, -1000000, -1000000, -913043, -652174, -521739, -391304, -217391, -43478, 217391]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 2347826, 2086956, 1956521, 1565217, 1478261, 1347826, 1173913, 913044, 391305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 34 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 34 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 34 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 34 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 1).all
    (fun j => modulusCheckBool 34 A D (34 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 34) : ModulusValid 34 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 34, A x) +
    ∑ m ∈ Finset.Icc 2 34, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 34 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 34 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 34 k)
    (hmin : ∀ i, 34 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N34
