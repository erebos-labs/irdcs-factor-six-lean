import IRDCS.ShortRow
import Mathlib.Data.List.Sublists

namespace IRDCS
open Finset

def candidates (n : ℕ) : Finset (ℕ × ℕ) :=
  ((Icc 2 n).product (range (n + 1))).filter (fun r =>
    r.2 < r.1 ∧ n ≤ 6 * r.1 ∧ 3 ≤ (shortRow n r.1 r.2).card)

def SelectionValid (n : ℕ) (S : Finset (ℕ × ℕ)) : Prop :=
  (∀ x ∈ Icc 1 n, (S.filter (fun r => x ∈ shortRow n r.1 r.2)).card = 1) ∧
  (∀ r ∈ S, ∀ t ∈ S, r.1 = t.1 → r = t)

instance (n : ℕ) (S : Finset (ℕ × ℕ)) : Decidable (SelectionValid n S) := by
  unfold SelectionValid
  infer_instance

def candidateList (n : ℕ) : List (ℕ × ℕ) :=
  ((List.range (n + 1)).flatMap (fun m =>
    (List.range (n + 1)).map (fun a => (m, a)))).filter (fun r =>
      decide (2 ≤ r.1 ∧ r.2 < r.1 ∧ n ≤ 6 * r.1 ∧
        3 ≤ (shortRow n r.1 r.2).card))

theorem mem_candidateList (n : ℕ) (r : ℕ × ℕ) :
    r ∈ candidateList n ↔ r ∈ candidates n := by
  rcases r with ⟨m,a⟩
  simp [candidateList, candidates, List.mem_flatMap, List.mem_map]
  omega

theorem list_exhaustion_sound (n : ℕ)
    (hcheck : (candidateList n).sublists.all (fun L => !decide (SelectionValid n L.toFinset)) = true) :
    ∀ S ∈ (candidates n).powerset, ¬ SelectionValid n S := by
  intro S hS
  have hsub := mem_powerset.mp hS
  let L := (candidateList n).filter (fun r => r ∈ S)
  have hL : L ∈ (candidateList n).sublists := by
    apply List.mem_sublists.mpr
    exact List.filter_sublist
  have hLeq : L.toFinset = S := by
    ext r
    simp only [L, List.mem_toFinset, List.mem_filter, decide_eq_true_eq]
    constructor
    · exact fun h => h.2
    · intro hr
      exact ⟨(mem_candidateList n r).mpr (hsub hr), hr⟩
  have hh := List.all_eq_true.mp hcheck L hL
  rw [hLeq] at hh
  simpa using hh

theorem finiteCover_sound {n k : ℕ} (C : TargetCover n k)
    (hmin : ∀ i, n ≤ 6 * C.modulus i) :
    ∃ S ∈ (candidates n).powerset, SelectionValid n S := by
  let code : Fin k → ℕ × ℕ := fun i => (C.modulus i, C.residue i % C.modulus i)
  let S := univ.image code
  have hmpos (i : Fin k) : 0 < C.modulus i := by have := C.modulus_ge_two i; omega
  have hcode (i : Fin k) :
      shortRow n (code i).1 (code i).2 = row n (C.modulus i) (C.residue i) := by
    dsimp [code]
    rw [← row_eq_shortRow (hmpos i) (hmin i), row_residue_mod]
  have hsubset : S ⊆ candidates n := by
    intro r hr
    obtain ⟨i, _, rfl⟩ := mem_image.mp hr
    apply mem_filter.mpr
    have hmle := modulus_le_of_three_hits (C.three_hits i)
    have hareduce := Nat.mod_lt (C.residue i) (hmpos i)
    refine ⟨mem_product.mpr ⟨mem_Icc.mpr ⟨C.modulus_ge_two i, hmle⟩,
      mem_range.mpr (by dsimp [code]; omega)⟩, ?_⟩
    exact ⟨hareduce, hmin i, by rw [hcode]; exact C.three_hits i⟩
  refine ⟨S, mem_powerset.mpr hsubset, ?_, ?_⟩
  · intro x hx
    obtain ⟨i, hi, huniq⟩ := C.partition x hx
    apply card_eq_one.mpr
    refine ⟨code i, ?_⟩
    ext r
    constructor
    · intro hr
      obtain ⟨hrS, hrx⟩ := mem_filter.mp hr
      obtain ⟨j, _, hrj⟩ := mem_image.mp hrS
      rw [← hrj, hcode] at hrx
      have hji := huniq j hrx
      apply mem_singleton.mpr
      exact hrj.symm.trans (congrArg code hji)
    · intro hr
      have hri := mem_singleton.mp hr
      subst r
      exact mem_filter.mpr ⟨mem_image.mpr ⟨i, mem_univ _, rfl⟩, by rw [hcode]; exact hi⟩
  · intro r hr t ht hsame
    obtain ⟨i, _, rfl⟩ := mem_image.mp hr
    obtain ⟨j, _, rfl⟩ := mem_image.mp ht
    have hij : i = j := C.distinct hsame
    rw [hij]

/-- A finite exhaustion can settle a named exception; it is not the all-n theorem. -/
theorem finiteCover_excludes (n : ℕ)
    (hcheck : ∀ S ∈ (candidates n).powerset, ¬ SelectionValid n S)
    {k : ℕ} (C : TargetCover n k) (hmin : ∀ i, n ≤ 6 * C.modulus i) : False := by
  obtain ⟨S, hS, hvalid⟩ := finiteCover_sound C hmin
  exact hcheck S hS hvalid

end IRDCS
