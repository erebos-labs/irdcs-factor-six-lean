import IRDCS.ShortRow

namespace IRDCS.Generated.N28
def pointWeights : List ℤ := [604651, 279070, -139535, -69767, -162791, -534884, -1000000, -976744, -1000000, -1000000, -813953, -465116, -511628, -139535, -139535, -511628, -465116, -813953, -1000000, -1000000, -976744, -1000000, -534884, -162791, -69767, -139535, 279070, 604651]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 2372093, 1976744, 1767442, 1674419, 1581395, 1186047, 395349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 28 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 28 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 28 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 3).all
    (fun j => modulusCheckBool 28 A D (26 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 28) : ModulusValid 28 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  by_cases h1 : m < 18
  · exact modulusBatch_sound modulus_batch_1 m (by omega) h1
  by_cases h2 : m < 26
  · exact modulusBatch_sound modulus_batch_2 m (by omega) h2
  exact modulusBatch_sound modulus_batch_3 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 28, A x) +
    ∑ m ∈ Finset.Icc 2 28, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 28 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 28 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 28 k)
    (hmin : ∀ i, 28 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N28
