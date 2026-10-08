import IRDCS.ShortRow

namespace IRDCS.Generated.N29
def pointWeights : List ℤ := [208214, -154022, -323446, -585282, -715916, -938962, -1000000, -899030, -859669, -565887, -225898, 206503, 507701, 739304, 901312, 739304, 507701, 206503, -225898, -565887, -859669, -899030, -1000000, -938962, -715916, -585282, -323446, -154022, 208214]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 1662294, 1464918, 1320594, 1098688, 976612, 877353, 585283, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 29 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 29 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 29 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 4).all
    (fun j => modulusCheckBool 29 A D (26 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 29) : ModulusValid 29 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 29, A x) +
    ∑ m ∈ Finset.Icc 2 29, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 29 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 29 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 29 k)
    (hmin : ∀ i, 29 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N29
