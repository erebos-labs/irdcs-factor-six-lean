import IRDCS.Generated.Period0
import IRDCS.Generated.Period1
import IRDCS.Generated.Period2
import IRDCS.Generated.Period3
import IRDCS.Generated.Period4
import IRDCS.Generated.Period5
import IRDCS.Generated.Period6
import IRDCS.Generated.Period7
import IRDCS.Generated.Period8
import IRDCS.Generated.Period9
import IRDCS.Generated.Period10
import IRDCS.Generated.Period11
import IRDCS.Generated.Period12
import IRDCS.Generated.Period13
import IRDCS.Generated.Period14
import IRDCS.Generated.Period15
import IRDCS.Generated.Period16
import IRDCS.Generated.Period17
import IRDCS.Generated.Period18
import IRDCS.Generated.Period19
import IRDCS.Generated.Period20
import IRDCS.Generated.Period21
import IRDCS.Generated.Period22
import IRDCS.Generated.Period23
import IRDCS.Generated.Period24
import IRDCS.Generated.Period25
import IRDCS.Generated.Period26
import IRDCS.Generated.Period27
import IRDCS.Generated.Period28
import IRDCS.Generated.Period29
import IRDCS.Generated.Period30
import IRDCS.Generated.Period31
import IRDCS.Generated.Period32
import IRDCS.Generated.Period33
import IRDCS.Generated.Period34
import IRDCS.Generated.Period35
import IRDCS.Generated.Period36
import IRDCS.Generated.Period37
import IRDCS.Generated.Period38
import IRDCS.Generated.Period39
import IRDCS.Generated.Period40
import IRDCS.Generated.Period41
import IRDCS.Generated.Period42
import IRDCS.Generated.Period43
import IRDCS.Generated.Period44
import IRDCS.Generated.Period45
import IRDCS.Generated.Period46
import IRDCS.Generated.Period47
import IRDCS.Generated.Period48
import IRDCS.Generated.Period49
import IRDCS.Generated.Period50
import IRDCS.Generated.Period51
import IRDCS.Generated.Period52
import IRDCS.Generated.Period53
import IRDCS.Generated.Period54
import IRDCS.Generated.Period55
import IRDCS.Generated.Period56
import IRDCS.Generated.Period57
import IRDCS.Generated.Period58
import IRDCS.Generated.Period59

namespace IRDCS.Generated
theorem first_period (r : ℕ) (hr : 0 < r) (hrP : r ≤ 3600) :
    S r < 46105 ∧ (0 ≤ S r ↔ r ∈ exceptions) := by
  by_cases h0 : r ≤ 60
  · exact period_chunk_0 r (Finset.mem_Icc.mpr ⟨by omega, h0⟩)
  by_cases h1 : r ≤ 120
  · exact period_chunk_1 r (Finset.mem_Icc.mpr ⟨by omega, h1⟩)
  by_cases h2 : r ≤ 180
  · exact period_chunk_2 r (Finset.mem_Icc.mpr ⟨by omega, h2⟩)
  by_cases h3 : r ≤ 240
  · exact period_chunk_3 r (Finset.mem_Icc.mpr ⟨by omega, h3⟩)
  by_cases h4 : r ≤ 300
  · exact period_chunk_4 r (Finset.mem_Icc.mpr ⟨by omega, h4⟩)
  by_cases h5 : r ≤ 360
  · exact period_chunk_5 r (Finset.mem_Icc.mpr ⟨by omega, h5⟩)
  by_cases h6 : r ≤ 420
  · exact period_chunk_6 r (Finset.mem_Icc.mpr ⟨by omega, h6⟩)
  by_cases h7 : r ≤ 480
  · exact period_chunk_7 r (Finset.mem_Icc.mpr ⟨by omega, h7⟩)
  by_cases h8 : r ≤ 540
  · exact period_chunk_8 r (Finset.mem_Icc.mpr ⟨by omega, h8⟩)
  by_cases h9 : r ≤ 600
  · exact period_chunk_9 r (Finset.mem_Icc.mpr ⟨by omega, h9⟩)
  by_cases h10 : r ≤ 660
  · exact period_chunk_10 r (Finset.mem_Icc.mpr ⟨by omega, h10⟩)
  by_cases h11 : r ≤ 720
  · exact period_chunk_11 r (Finset.mem_Icc.mpr ⟨by omega, h11⟩)
  by_cases h12 : r ≤ 780
  · exact period_chunk_12 r (Finset.mem_Icc.mpr ⟨by omega, h12⟩)
  by_cases h13 : r ≤ 840
  · exact period_chunk_13 r (Finset.mem_Icc.mpr ⟨by omega, h13⟩)
  by_cases h14 : r ≤ 900
  · exact period_chunk_14 r (Finset.mem_Icc.mpr ⟨by omega, h14⟩)
  by_cases h15 : r ≤ 960
  · exact period_chunk_15 r (Finset.mem_Icc.mpr ⟨by omega, h15⟩)
  by_cases h16 : r ≤ 1020
  · exact period_chunk_16 r (Finset.mem_Icc.mpr ⟨by omega, h16⟩)
  by_cases h17 : r ≤ 1080
  · exact period_chunk_17 r (Finset.mem_Icc.mpr ⟨by omega, h17⟩)
  by_cases h18 : r ≤ 1140
  · exact period_chunk_18 r (Finset.mem_Icc.mpr ⟨by omega, h18⟩)
  by_cases h19 : r ≤ 1200
  · exact period_chunk_19 r (Finset.mem_Icc.mpr ⟨by omega, h19⟩)
  by_cases h20 : r ≤ 1260
  · exact period_chunk_20 r (Finset.mem_Icc.mpr ⟨by omega, h20⟩)
  by_cases h21 : r ≤ 1320
  · exact period_chunk_21 r (Finset.mem_Icc.mpr ⟨by omega, h21⟩)
  by_cases h22 : r ≤ 1380
  · exact period_chunk_22 r (Finset.mem_Icc.mpr ⟨by omega, h22⟩)
  by_cases h23 : r ≤ 1440
  · exact period_chunk_23 r (Finset.mem_Icc.mpr ⟨by omega, h23⟩)
  by_cases h24 : r ≤ 1500
  · exact period_chunk_24 r (Finset.mem_Icc.mpr ⟨by omega, h24⟩)
  by_cases h25 : r ≤ 1560
  · exact period_chunk_25 r (Finset.mem_Icc.mpr ⟨by omega, h25⟩)
  by_cases h26 : r ≤ 1620
  · exact period_chunk_26 r (Finset.mem_Icc.mpr ⟨by omega, h26⟩)
  by_cases h27 : r ≤ 1680
  · exact period_chunk_27 r (Finset.mem_Icc.mpr ⟨by omega, h27⟩)
  by_cases h28 : r ≤ 1740
  · exact period_chunk_28 r (Finset.mem_Icc.mpr ⟨by omega, h28⟩)
  by_cases h29 : r ≤ 1800
  · exact period_chunk_29 r (Finset.mem_Icc.mpr ⟨by omega, h29⟩)
  by_cases h30 : r ≤ 1860
  · exact period_chunk_30 r (Finset.mem_Icc.mpr ⟨by omega, h30⟩)
  by_cases h31 : r ≤ 1920
  · exact period_chunk_31 r (Finset.mem_Icc.mpr ⟨by omega, h31⟩)
  by_cases h32 : r ≤ 1980
  · exact period_chunk_32 r (Finset.mem_Icc.mpr ⟨by omega, h32⟩)
  by_cases h33 : r ≤ 2040
  · exact period_chunk_33 r (Finset.mem_Icc.mpr ⟨by omega, h33⟩)
  by_cases h34 : r ≤ 2100
  · exact period_chunk_34 r (Finset.mem_Icc.mpr ⟨by omega, h34⟩)
  by_cases h35 : r ≤ 2160
  · exact period_chunk_35 r (Finset.mem_Icc.mpr ⟨by omega, h35⟩)
  by_cases h36 : r ≤ 2220
  · exact period_chunk_36 r (Finset.mem_Icc.mpr ⟨by omega, h36⟩)
  by_cases h37 : r ≤ 2280
  · exact period_chunk_37 r (Finset.mem_Icc.mpr ⟨by omega, h37⟩)
  by_cases h38 : r ≤ 2340
  · exact period_chunk_38 r (Finset.mem_Icc.mpr ⟨by omega, h38⟩)
  by_cases h39 : r ≤ 2400
  · exact period_chunk_39 r (Finset.mem_Icc.mpr ⟨by omega, h39⟩)
  by_cases h40 : r ≤ 2460
  · exact period_chunk_40 r (Finset.mem_Icc.mpr ⟨by omega, h40⟩)
  by_cases h41 : r ≤ 2520
  · exact period_chunk_41 r (Finset.mem_Icc.mpr ⟨by omega, h41⟩)
  by_cases h42 : r ≤ 2580
  · exact period_chunk_42 r (Finset.mem_Icc.mpr ⟨by omega, h42⟩)
  by_cases h43 : r ≤ 2640
  · exact period_chunk_43 r (Finset.mem_Icc.mpr ⟨by omega, h43⟩)
  by_cases h44 : r ≤ 2700
  · exact period_chunk_44 r (Finset.mem_Icc.mpr ⟨by omega, h44⟩)
  by_cases h45 : r ≤ 2760
  · exact period_chunk_45 r (Finset.mem_Icc.mpr ⟨by omega, h45⟩)
  by_cases h46 : r ≤ 2820
  · exact period_chunk_46 r (Finset.mem_Icc.mpr ⟨by omega, h46⟩)
  by_cases h47 : r ≤ 2880
  · exact period_chunk_47 r (Finset.mem_Icc.mpr ⟨by omega, h47⟩)
  by_cases h48 : r ≤ 2940
  · exact period_chunk_48 r (Finset.mem_Icc.mpr ⟨by omega, h48⟩)
  by_cases h49 : r ≤ 3000
  · exact period_chunk_49 r (Finset.mem_Icc.mpr ⟨by omega, h49⟩)
  by_cases h50 : r ≤ 3060
  · exact period_chunk_50 r (Finset.mem_Icc.mpr ⟨by omega, h50⟩)
  by_cases h51 : r ≤ 3120
  · exact period_chunk_51 r (Finset.mem_Icc.mpr ⟨by omega, h51⟩)
  by_cases h52 : r ≤ 3180
  · exact period_chunk_52 r (Finset.mem_Icc.mpr ⟨by omega, h52⟩)
  by_cases h53 : r ≤ 3240
  · exact period_chunk_53 r (Finset.mem_Icc.mpr ⟨by omega, h53⟩)
  by_cases h54 : r ≤ 3300
  · exact period_chunk_54 r (Finset.mem_Icc.mpr ⟨by omega, h54⟩)
  by_cases h55 : r ≤ 3360
  · exact period_chunk_55 r (Finset.mem_Icc.mpr ⟨by omega, h55⟩)
  by_cases h56 : r ≤ 3420
  · exact period_chunk_56 r (Finset.mem_Icc.mpr ⟨by omega, h56⟩)
  by_cases h57 : r ≤ 3480
  · exact period_chunk_57 r (Finset.mem_Icc.mpr ⟨by omega, h57⟩)
  by_cases h58 : r ≤ 3540
  · exact period_chunk_58 r (Finset.mem_Icc.mpr ⟨by omega, h58⟩)
  exact period_chunk_59 r (Finset.mem_Icc.mpr ⟨by omega, hrP⟩)

theorem negative_tail (n : ℕ) (hn : 3600 < n) : S n < 0 :=
  periodic_tail_negative S 3600 46105 (by decide) (by decide)
    (fun n _ => actual_periodicity n) (fun r hr hP => (first_period r hr hP).1) n hn

theorem nonnegative_only_at_exceptions (n : ℕ) (hn : 0 < n) (hS : 0 ≤ S n) :
    n ∈ exceptions := by
  have hnP : n ≤ 3600 := by
    by_contra h
    have := negative_tail n (by omega)
    omega
  exact (first_period n hn hnP).2.mp hS
end IRDCS.Generated
