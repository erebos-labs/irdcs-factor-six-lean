import IRDCS.ShortRow

namespace IRDCS.Generated.N16
def pointWeights : List ℤ := [217391, -43478, -391304, -1000000, -1000000, -1000000, -521739, -173913, -173913, -521739, -1000000, -1000000, -1000000, -391304, -43478, 217391]
def modulusWeights : List ℤ := [0, 0, 0, 2608696, 1956522, 1565218, 1304348, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 16 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 7).all
    (fun j => modulusCheckBool 16 A D (10 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 16) : ModulusValid 16 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  exact modulusBatch_sound modulus_batch_1 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 16, A x) +
    ∑ m ∈ Finset.Icc 2 16, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 16 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 16 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 16 k)
    (hmin : ∀ i, 16 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N16
