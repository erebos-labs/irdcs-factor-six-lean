import IRDCS.ShortRow

namespace IRDCS.Generated.N46
def pointWeights : List ℤ := [331259, 114454, -93707, -220609, -338866, -416667, -428423, -624827, -828838, -918741, -1000000, -1000000, -991355, -942254, -884509, -819156, -561203, -295297, -78492, 48409, 85408, 265214, 387967, 387967, 265214, 85408, 48409, -78492, -295297, -561203, -819156, -884509, -942254, -991355, -1000000, -1000000, -918741, -828838, -624827, -428423, -416667, -338866, -220609, -93707, 114454, 331259]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 2368948, 2194329, 1859958, 1938451, 1612033, 1563624, 1359613, 1331259, 1172200, 964039, 665975, 245160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 46 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 46 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 46 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 46 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 46 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 5).all
    (fun j => modulusCheckBool 46 A D (42 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 46) : ModulusValid 46 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 46, A x) +
    ∑ m ∈ Finset.Icc 2 46, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 46 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 46 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 46 k)
    (hmin : ∀ i, 46 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N46
