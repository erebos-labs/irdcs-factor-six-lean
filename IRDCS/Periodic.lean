import IRDCS.Basic

namespace IRDCS

/-- An algebraic one-period identity implies the exact all-period identity. -/
theorem periodic_iterate (S : ℕ → ℤ) (P : ℕ) (drop : ℤ)
    (hstep : ∀ n, 0 < n → S (n + P) = S n - drop)
    (r : ℕ) (hr : 0 < r) (q : ℕ) :
    S (r + q * P) = S r - (q : ℤ) * drop := by
  induction q with
  | zero => simp
  | succ q ih =>
    rw [Nat.succ_mul, ← Nat.add_assoc, hstep _ (by omega), ih]
    push_cast
    ring

/-- The infinite tail is excluded from a bounded first period and negative drift.
The identity is a premise to prove algebraically, not a finite test assertion. -/
theorem periodic_tail_negative (S : ℕ → ℤ) (P : ℕ) (drop : ℤ)
    (hP : 0 < P) (hd : 0 < drop)
    (hstep : ∀ n, 0 < n → S (n + P) = S n - drop)
    (hbase : ∀ r, 0 < r → r ≤ P → S r < drop)
    (n : ℕ) (hn : P < n) : S n < 0 := by
  let r := (n - 1) % P + 1
  let q := (n - 1) / P
  have hr : 0 < r := by omega
  have hrP : r ≤ P := by
    have := Nat.mod_lt (n - 1) hP
    dsimp [r]
    omega
  have hdecomp : n = r + q * P := by
    have hh := Nat.mod_add_div (n - 1) P
    rw [Nat.mul_comm P] at hh
    dsimp [r, q]
    omega
  have hq : 1 ≤ q := by
    by_contra hqbad
    have hqzero : q = 0 := Nat.eq_zero_of_not_pos (by simpa using hqbad)
    have hh : n = r := by simpa [hqzero] using hdecomp
    omega
  rw [hdecomp, periodic_iterate S P drop hstep r hr q]
  have hb := hbase r hr hrP
  have hq' : (1 : ℤ) ≤ (q : ℤ) := by exact_mod_cast hq
  nlinarith

end IRDCS
