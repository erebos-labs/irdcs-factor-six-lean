import IRDCS.SmallExceptions
import IRDCS.Generated.GridData
import IRDCS.Generated.N1
import IRDCS.Generated.N2
import IRDCS.Generated.N3
import IRDCS.Generated.N4
import IRDCS.Generated.N5
import IRDCS.Generated.N6
import IRDCS.Generated.N10
import IRDCS.Generated.N15
import IRDCS.Generated.N16
import IRDCS.Generated.N17
import IRDCS.Generated.N18
import IRDCS.Generated.N21
import IRDCS.Generated.N22
import IRDCS.Generated.N23
import IRDCS.Generated.N24
import IRDCS.Generated.N28
import IRDCS.Generated.N29
import IRDCS.Generated.N30
import IRDCS.Generated.N34
import IRDCS.Generated.N35
import IRDCS.Generated.N36
import IRDCS.Generated.N40
import IRDCS.Generated.N41
import IRDCS.Generated.N42
import IRDCS.Generated.N46
import IRDCS.Generated.N47
import IRDCS.Generated.N48
import IRDCS.Generated.N53
import IRDCS.Generated.N54
import IRDCS.Generated.N60
import IRDCS.Generated.N62
import IRDCS.Generated.N64
import IRDCS.Generated.N65
import IRDCS.Generated.N66
import IRDCS.Generated.N70
import IRDCS.Generated.N71
import IRDCS.Generated.N72
import IRDCS.Generated.N77
import IRDCS.Generated.N78
import IRDCS.Generated.N83
import IRDCS.Generated.N84
import IRDCS.Generated.N90
import IRDCS.Generated.N95
import IRDCS.Generated.N96
import IRDCS.Generated.N101
import IRDCS.Generated.N102
import IRDCS.Generated.N108
import IRDCS.Generated.N120
import IRDCS.Generated.N125
import IRDCS.Generated.N126
import IRDCS.Generated.N132
import IRDCS.Generated.N138
import IRDCS.Generated.N144
import IRDCS.Generated.N150
import IRDCS.Generated.N156
import IRDCS.Generated.N162
import IRDCS.Generated.N168
import IRDCS.Generated.N180
import IRDCS.Generated.N186
import IRDCS.Generated.N192
import IRDCS.Generated.N240

namespace IRDCS.Generated
theorem all_exceptions_excluded (n : ℕ) (hn : n ∈ exceptions) {k : ℕ}
    (C : TargetCover n k) (hmin : ∀ i, n ≤ 6 * C.modulus i) : False := by
  simp only [exceptions, List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hn
  rcases hn with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25 | h26 | h27 | h28 | h29 | h30 | h31 | h32 | h33 | h34 | h35 | h36 | h37 | h38 | h39 | h40 | h41 | h42 | h43 | h44 | h45 | h46 | h47 | h48 | h49 | h50 | h51 | h52 | h53 | h54 | h55 | h56 | h57 | h58 | h59 | h60 | h61 | h62
  · subst n
    exact N1.excludes C hmin
  · subst n
    exact N2.excludes C hmin
  · subst n
    exact N3.excludes C hmin
  · subst n
    exact N4.excludes C hmin
  · subst n
    exact N5.excludes C hmin
  · subst n
    exact N6.excludes C hmin
  · subst n
    exact N10.excludes C hmin
  · subst n
    exact finiteCover_excludes 11 checked_eleven C hmin
  · subst n
    exact finiteCover_excludes 12 checked_twelve C hmin
  · subst n
    exact N15.excludes C hmin
  · subst n
    exact N16.excludes C hmin
  · subst n
    exact N17.excludes C hmin
  · subst n
    exact N18.excludes C hmin
  · subst n
    exact N21.excludes C hmin
  · subst n
    exact N22.excludes C hmin
  · subst n
    exact N23.excludes C hmin
  · subst n
    exact N24.excludes C hmin
  · subst n
    exact N28.excludes C hmin
  · subst n
    exact N29.excludes C hmin
  · subst n
    exact N30.excludes C hmin
  · subst n
    exact N34.excludes C hmin
  · subst n
    exact N35.excludes C hmin
  · subst n
    exact N36.excludes C hmin
  · subst n
    exact N40.excludes C hmin
  · subst n
    exact N41.excludes C hmin
  · subst n
    exact N42.excludes C hmin
  · subst n
    exact N46.excludes C hmin
  · subst n
    exact N47.excludes C hmin
  · subst n
    exact N48.excludes C hmin
  · subst n
    exact N53.excludes C hmin
  · subst n
    exact N54.excludes C hmin
  · subst n
    exact N60.excludes C hmin
  · subst n
    exact N62.excludes C hmin
  · subst n
    exact N64.excludes C hmin
  · subst n
    exact N65.excludes C hmin
  · subst n
    exact N66.excludes C hmin
  · subst n
    exact N70.excludes C hmin
  · subst n
    exact N71.excludes C hmin
  · subst n
    exact N72.excludes C hmin
  · subst n
    exact N77.excludes C hmin
  · subst n
    exact N78.excludes C hmin
  · subst n
    exact N83.excludes C hmin
  · subst n
    exact N84.excludes C hmin
  · subst n
    exact N90.excludes C hmin
  · subst n
    exact N95.excludes C hmin
  · subst n
    exact N96.excludes C hmin
  · subst n
    exact N101.excludes C hmin
  · subst n
    exact N102.excludes C hmin
  · subst n
    exact N108.excludes C hmin
  · subst n
    exact N120.excludes C hmin
  · subst n
    exact N125.excludes C hmin
  · subst n
    exact N126.excludes C hmin
  · subst n
    exact N132.excludes C hmin
  · subst n
    exact N138.excludes C hmin
  · subst n
    exact N144.excludes C hmin
  · subst n
    exact N150.excludes C hmin
  · subst n
    exact N156.excludes C hmin
  · subst n
    exact N162.excludes C hmin
  · subst n
    exact N168.excludes C hmin
  · subst n
    exact N180.excludes C hmin
  · subst n
    exact N186.excludes C hmin
  · subst n
    exact N192.excludes C hmin
  · subst n
    exact N240.excludes C hmin
end IRDCS.Generated
