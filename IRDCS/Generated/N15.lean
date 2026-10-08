import IRDCS.ShortRow

namespace IRDCS.Generated.N15
def pointWeights : List ℤ := [1000000, -166667, -433333, -1000000, -1000000, -800000, -100000, 533333, -100000, -333333, -1000000, -533333, -900000, 300000, 533333]
def modulusWeights : List ℤ := [0, 0, 0, 1333334, 1000000, 800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 15 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 6).all
    (fun j => modulusCheckBool 15 A D (10 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 15) : ModulusValid 15 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  exact modulusBatch_sound modulus_batch_1 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 15, A x) +
    ∑ m ∈ Finset.Icc 2 15, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 15 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 15 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 15 k)
    (hmin : ∀ i, 15 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N15
