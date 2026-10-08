import IRDCS.ShortRow

namespace IRDCS.Generated.N2
def pointWeights : List ℤ := [-1000000, -1000000]
def modulusWeights : List ℤ := [0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 1).all
    (fun j => modulusCheckBool 2 A D (2 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 2) : ModulusValid 2 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  exact modulusBatch_sound modulus_batch_0 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 2, A x) +
    ∑ m ∈ Finset.Icc 2 2, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 2 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 2 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 2 k)
    (hmin : ∀ i, 2 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N2
