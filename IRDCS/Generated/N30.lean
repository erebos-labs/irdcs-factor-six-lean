import IRDCS.ShortRow

namespace IRDCS.Generated.N30
def pointWeights : List ℤ := [10830, 10830, -462094, -404332, -826715, -678700, -1000000, -761733, -1000000, -184116, -379061, 429603, 667870, 851986, 945848, 945848, 851986, 667870, 429603, -379061, -184116, -1000000, -761733, -1000000, -678700, -826715, -404332, -462094, 10830, 10830]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 1111914, 1104694, 794225, 815885, 736462, 559567, 321300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 30 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 30 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 30 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 5).all
    (fun j => modulusCheckBool 30 A D (26 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 30) : ModulusValid 30 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 30, A x) +
    ∑ m ∈ Finset.Icc 2 30, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 30 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 30 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 30 k)
    (hmin : ∀ i, 30 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N30
