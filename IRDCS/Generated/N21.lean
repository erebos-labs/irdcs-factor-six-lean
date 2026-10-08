import IRDCS.ShortRow

namespace IRDCS.Generated.N21
def pointWeights : List ℤ := [346154, -153846, -423077, -769231, -1000000, -1000000, -1000000, -692308, -192308, 76923, 307692, 76923, -192308, -692308, -1000000, -1000000, -1000000, -769231, -423077, -153846, 346154]
def modulusWeights : List ℤ := [0, 0, 0, 0, 2538462, 2076924, 1692308, 1346154, 846154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 21 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 21 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 4).all
    (fun j => modulusCheckBool 21 A D (18 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 21) : ModulusValid 21 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  by_cases h1 : m < 18
  · exact modulusBatch_sound modulus_batch_1 m (by omega) h1
  exact modulusBatch_sound modulus_batch_2 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 21, A x) +
    ∑ m ∈ Finset.Icc 2 21, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 21 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 21 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 21 k)
    (hmin : ∀ i, 21 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N21
