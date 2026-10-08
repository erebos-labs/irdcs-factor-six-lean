import IRDCS.ShortRow

namespace IRDCS.Generated.N64
def pointWeights : List ℤ := [324338, 156422, -4998, -128436, -239880, -318841, -367816, -487756, -568716, -655672, -736632, -820590, -898051, -949025, -993503, -1000000, -1000000, -997501, -968016, -900550, -785607, -706647, -567716, -447776, -256872, -115942, 1000, 84958, 165917, 246377, 323838, 368316, 368316, 323838, 246377, 165917, 84958, 1000, -115942, -256872, -447776, -567716, -706647, -785607, -900550, -968016, -997501, -1000000, -1000000, -993503, -949025, -898051, -820590, -736632, -655672, -568716, -487756, -367816, -318841, -239880, -128436, -4998, 156422, 324338]
def modulusWeights : List ℤ := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2516242, 2374313, 2186907, 2000499, 1887556, 1761120, 1631185, 1574213, 1490255, 1402799, 1353324, 1259371, 1120940, 953023, 740630, 495252, 246377, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
def A (x : ℕ) : ℤ := pointWeights.getD (x - 1) 0
def D (m : ℕ) : ℤ := modulusWeights.getD m 0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_0 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (2 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_1 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (10 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_2 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (18 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_3 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (26 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_4 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (34 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_5 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (42 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_6 : (List.range 8).all
    (fun j => modulusCheckBool 64 A D (50 + j)) = true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem modulus_batch_7 : (List.range 7).all
    (fun j => modulusCheckBool 64 A D (58 + j)) = true := by decide

theorem per_modulus (m : ℕ) (hm : m ∈ Finset.Icc 2 64) : ModulusValid 64 A D m := by
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
  by_cases h5 : m < 50
  · exact modulusBatch_sound modulus_batch_5 m (by omega) h5
  by_cases h6 : m < 58
  · exact modulusBatch_sound modulus_batch_6 m (by omega) h6
  exact modulusBatch_sound modulus_batch_7 m (by omega) (by omega)


set_option maxRecDepth 100000 in
theorem checked_total : (∑ x ∈ Finset.Icc 1 64, A x) +
    ∑ m ∈ Finset.Icc 2 64, D m < 0 := by decide

theorem checked_fast : FastFiniteValid 64 A D :=
  ⟨fun m hm => (per_modulus m hm).1,
    fun m hm => (per_modulus m hm).2, checked_total⟩

theorem checked : FiniteValid 64 A D := fastFiniteValid_sound checked_fast

theorem excludes {k : ℕ} (C : TargetCover 64 k)
    (hmin : ∀ i, 64 ≤ 6 * C.modulus i) : False :=
  finiteValid_excludes A D checked C hmin

end IRDCS.Generated.N64
