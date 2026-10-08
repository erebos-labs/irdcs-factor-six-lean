import IRDCS.ShortRow

namespace IRDCS.Generated.N17
def pointWeights : List ℤ := [0, -333333, -407407, -444444, -222222, 37037, 629630, 962963, 1000000, 740741, 185185, -407407, -1000000, -1000000, -962963, -666667, -333333]
def modulusWeights : List ℤ := [0, 0, 0, 740740, 555555, 444445, 370370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 17 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 17 A D (10 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 17) : ModulusValid 17 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  exact modulusBatch_sound modulus_batch_1 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 17, A x) +
    ∑ m ∈ Finset.Icc 2 17, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 17 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 17 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 17 k)
    (hmin : ∀ i, 17 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N17
