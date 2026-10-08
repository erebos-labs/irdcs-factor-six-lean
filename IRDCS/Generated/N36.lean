import IRDCS.ShortRow

namespace IRDCS.Generated.N36
def pointWeights : List ℤ := [232170, -110774, -291351, -505311, -556904, -778452, -907436, -1000000, -1000000, -963581, -764795, -728376, -393020, -13657, 365706, 616085, 667678, 796662, 796662, 667678, 616085, 365706, -13657, -393020, -728376, -764795, -963581, -1000000, -1000000, -907436, -778452, -556904, -505311, -291351, -110774, 232170]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 1778452, 1758726, 1333839, 1311078, 1203339, 1110774, 889226, 745069, 402125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 36 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 36 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 36 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 36 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 3).all
    (fun j => modulusCheckBool 36 A D (34 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 36) : ModulusValid 36 A D m := by
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
  exact modulusBatch_sound modulus_batch_4 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 36, A x) +
    ∑ m ∈ Finset.Icc 2 36, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 36 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 36 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 36 k)
    (hmin : ∀ i, 36 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N36
