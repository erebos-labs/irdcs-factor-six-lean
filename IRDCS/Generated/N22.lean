import IRDCS.ShortRow

namespace IRDCS.Generated.N22
def pointWeights : List ℤ := [44444, -444444, -555556, -822222, -1000000, -1000000, -666667, -288889, 288889, 777778, 1000000, 1000000, 777778, 288889, -288889, -666667, -1000000, -1000000, -822222, -555556, -444444, 44444]
def modulusWeights : List ℤ := [0, 0, 0, 0, 1333334, 1066667, 1000000, 822222, 666667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 22 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 22 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 5).all
    (fun j => modulusCheckBool 22 A D (18 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 22) : ModulusValid 22 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  by_cases h1 : m < 18
  · exact modulusBatch_sound modulus_batch_1 m (by omega) h1
  exact modulusBatch_sound modulus_batch_2 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 22, A x) +
    ∑ m ∈ Finset.Icc 2 22, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 22 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 22 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 22 k)
    (hmin : ∀ i, 22 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N22
