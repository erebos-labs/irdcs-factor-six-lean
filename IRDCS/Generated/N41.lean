import IRDCS.ShortRow

namespace IRDCS.Generated.N41
def pointWeights : List ℤ := [287037, 64815, -185185, -277778, -500000, -574074, -722222, -898148, -888889, -1000000, -1000000, -990741, -861111, -648148, -407407, -18519, 203704, 435185, 509259, 685185, 916667, 685185, 509259, 435185, 203704, -18519, -407407, -648148, -861111, -990741, -1000000, -1000000, -888889, -898148, -722222, -574074, -500000, -277778, -185185, 64815, 287037]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 1824075, 1805556, 1435185, 1425926, 1203704, 1212963, 1064815, 981481, 731482, 398148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 41 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 41 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 41 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 41 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 41 A D (34 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 41) : ModulusValid 41 A D m := by
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
theorem checked_total : (∑ x ∈ Finset.Icc 1 41, A x) +
    ∑ m ∈ Finset.Icc 2 41, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 41 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 41 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 41 k)
    (hmin : ∀ i, 41 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N41
