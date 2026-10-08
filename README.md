# IRDCS factor-six theorem in Lean

This repository formalizes a necessary condition for a three-hit incongruent restricted disjoint covering system of the interval `{1, ..., n}`. It proves a conditional bound; the original existence problem remains open. Novelty and priority are not established, and no human peer review is claimed.

## Exact statement

Let `n : ℕ` and let `I` be any indexing type. For each `i : I`, choose integer modulus `m_i ≥ 2` and integer residue `a_i`. Define the complete row

`R_i = {x ∈ {1, ..., n} : x ≡ a_i (mod m_i)}`.

Assume that the moduli are pairwise distinct, every row has at least three members, and every interval member belongs to exactly one row. If `i₀ : I` satisfies `m_i₀ ≤ m_j` for all `j : I`, then

`6 * m_i₀ < n`.

There is no bound on `n` and no finite-family premise: finiteness is derived from the covering hypotheses. The declarations are `IRDCS.GeneralIntegerCover` and `IRDCS.factorSix_arbitrary_index` in [IRDCS/ArbitraryIndex.lean](IRDCS/ArbitraryIndex.lean). The finite integer and natural-number versions are `IRDCS.factorSix_integer` and `IRDCS.factorSix` in [IRDCS/Final.lean](IRDCS/Final.lean).

```lean
theorem factorSix_arbitrary_index {n : ℕ} {I : Type u}
    (C : GeneralIntegerCover n I) (i : I)
    (hmin : ∀ j, C.modulus i ≤ C.modulus j) :
    6 * C.modulus i < (n : ℤ)
```

## Build

Install Git, Python 3, and [Lean via elan](https://lean-lang.org/install/manual/). The `lean-toolchain` file selects Lean 4.19.0. Run from the repository root. The unchanged Lake configuration expects mathlib at `.tooling/mathlib`; clone the official repository and check out this exact revision:

```sh
mkdir -p .tooling
git clone https://github.com/leanprover-community/mathlib4.git .tooling/mathlib
git -C .tooling/mathlib checkout --detach c44e0c8ee63ca166450922a373c7409c5d26b00b
lake env lean --version
lake env lean --run .tooling/mathlib/Cache/Main.lean get \
  .tooling/mathlib/Mathlib/Order/Interval/Finset/Nat.lean \
  .tooling/mathlib/Mathlib/Algebra/Order/BigOperators/Group/Finset.lean \
  .tooling/mathlib/Mathlib/Tactic.lean
python3 scripts/build.py
lake env lean Verify.lean
```

Lake uses the committed manifest to fetch the pinned transitive dependencies. The cache command fetches dependency artifacts; the project certificate sources remain local source builds. The helper requests the 590 project modules in dependency order, one Lake invocation at a time, then runs the aggregate build. Large certificates can require about 10 GB of memory; allow substantial time for a fresh build. On a machine with sufficient memory, the direct command is `lake --no-cache build IRDCS`.

No data regeneration is required. The generated certificate source files are included and checked by Lean.

## Verification and trust

All 590 modules in the final theorem dependency graph passed a clean source rebuild with the pinned Lean/mathlib dependencies. No project-owned compiled artifacts were copied into that verification build. The explicit hypothesis example and axiom audits also passed. The axioms reported for the three final theorems are only `propext`, `Classical.choice`, and `Quot.sound`. Normal trust in Lean's kernel and the pinned dependencies applies.

[verification/summary.json](verification/summary.json) records the sanitized results. [verification/source-hashes.json](verification/source-hashes.json) binds the proof sources and original configuration to the verified inputs. `FILES.sha256` covers every distributed file except itself. Optional legacy modules outside the final theorem graph are omitted. No caches, papers, raw local logs, private notes, credentials, or third-party dependency source trees are distributed here.

OpenAI Codex assisted with the formalization, generated certificate data, and independent verification. Kernel acceptance does not establish novelty, priority, or human peer review.

## Related work

- **Emanuel2011**: Paul Robert Emanuel, *Covering systems*, PhD thesis, Macquarie University, 2011. [DOI](https://doi.org/10.25949/19441907).
- **Wilson2026**: Josiah Wilson, *Three-hit incongruent restricted disjoint covering systems*, 2026. [Repository](https://github.com/Aperturesurvivor/irdcs-three-hits).
- **Manannikov2026**: related work, 2026. [DOI](https://doi.org/10.5281/zenodo.22946024).

These references provide context and attribution; no claim of priority is made.

## License

Project materials are released under the [MIT License](LICENSE), attributed to Erebos Labs. Separately fetched dependencies retain their upstream licenses; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
