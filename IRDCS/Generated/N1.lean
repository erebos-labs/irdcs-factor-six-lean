import IRDCS.ShortRow

namespace IRDCS.Generated.N1
def pointWeights : List ℤ := [-1000000]
def modulusWeights : List ℤ := [0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 1) : ModulusValid 1 A D m := by
  have hmlo := (Finset.mem_Icc.mp hm).1
  have hmhi := (Finset.mem_Icc.mp hm).2
  omega


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 1, A x) +
    ∑ m ∈ Finset.Icc 2 1, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 1 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 1 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 1 k)
    (hmin : ∀ i, 1 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N1
