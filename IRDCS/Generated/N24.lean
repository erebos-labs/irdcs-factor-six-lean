import IRDCS.ShortRow

namespace IRDCS.Generated.N24
def pointWeights : List ℤ := [784314, 333333, 215686, -274510, -431373, -882353, -1000000, -960784, -1000000, -509804, -509804, -470588, -470588, -509804, -509804, -1000000, -960784, -1000000, -882353, -431373, -274510, 215686, 333333, 784314]
def modulusWeights : List ℤ := [0, 0, 0, 0, 2352942, 1882354, 1568628, 1784314, 1176471, 607844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 24 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 24 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 7).all
    (fun j => modulusCheckBool 24 A D (18 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 24) : ModulusValid 24 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  by_cases h0 : m < 10
  · exact modulusBatch_sound modulus_batch_0 m (by omega) h0
  by_cases h1 : m < 18
  · exact modulusBatch_sound modulus_batch_1 m (by omega) h1
  exact modulusBatch_sound modulus_batch_2 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 24, A x) +
    ∑ m ∈ Finset.Icc 2 24, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 24 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 24 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 24 k)
    (hmin : ∀ i, 24 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N24
