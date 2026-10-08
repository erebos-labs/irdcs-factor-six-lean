import IRDCS.ShortRow

namespace IRDCS.Generated.N47
def pointWeights : List ℤ := [319171, 93091, -107743, -262031, -340133, -511890, -624930, -704046, -847628, -957286, -1000000, -1000000, -966077, -937000, -856982, -708554, -534881, -241407, -6649, 194185, 305759, 418799, 562380, 689507, 562380, 418799, 305759, 194185, -6649, -241407, -534881, -708554, -856982, -937000, -966077, -1000000, -1000000, -957286, -847628, -704046, -624930, -511890, -340133, -262031, -107743, 93091, 319171]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 2135693, 2048237, 1708555, 1700214, 1506594, 1394906, 1285248, 1206132, 1085316, 913558, 687478, 334272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 47 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 47 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 47 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 47 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 47 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 6).all
    (fun j => modulusCheckBool 47 A D (42 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 47) : ModulusValid 47 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 47, A x) +
    ∑ m ∈ Finset.Icc 2 47, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 47 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 47 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 47 k)
    (hmin : ∀ i, 47 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N47
