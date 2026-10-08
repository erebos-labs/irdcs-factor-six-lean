import IRDCS.ShortRow

namespace IRDCS.Generated.N48
def pointWeights : List ℤ := [421872, 197013, -42431, -204271, -305744, -407216, -598227, -720916, -858190, -917859, -992114, -988764, -1000000, -930979, -885826, -814153, -684765, -388234, -94354, 133854, 299044, 401214, 527252, 590271, 590271, 527252, 401214, 299044, 133854, -94354, -388234, -684765, -814153, -885826, -930979, -1000000, -988764, -992114, -917859, -858190, -720916, -598227, -407216, -305744, -204271, -42431, 197013, 421872]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 2065881, 2115152, 1736549, 1710797, 1577571, 1390607, 1319702, 1185778, 1077047, 897341, 661247, 362133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 48 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 48 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 48 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 48 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 48 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 7).all
    (fun j => modulusCheckBool 48 A D (42 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 48) : ModulusValid 48 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 48, A x) +
    ∑ m ∈ Finset.Icc 2 48, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 48 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 48 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 48 k)
    (hmin : ∀ i, 48 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N48
