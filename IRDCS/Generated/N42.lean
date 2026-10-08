import IRDCS.ShortRow

namespace IRDCS.Generated.N42
def pointWeights : List ℤ := [261324, 24390, -195122, -296167, -432056, -581882, -714286, -829268, -926829, -972125, -1000000, -923345, -829268, -766551, -606272, -306620, 6969, 198606, 320557, 425087, 494774, 494774, 425087, 320557, 198606, 6969, -306620, -606272, -766551, -829268, -923345, -1000000, -972125, -926829, -829268, -714286, -581882, -432056, -296167, -195122, 24390, 261324]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 2195122, 2114983, 1749130, 1668990, 1477353, 1404181, 1261325, 1111499, 968641, 703833, 369339, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 42 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 42 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 42 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 42 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 42 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 1).all
    (fun j => modulusCheckBool 42 A D (42 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 42) : ModulusValid 42 A D m := by
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
  exact modulusBatch_sound modulus_batch_5 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 42, A x) +
    ∑ m ∈ Finset.Icc 2 42, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 42 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 42 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 42 k)
    (hmin : ∀ i, 42 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N42
