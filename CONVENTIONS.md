# Conventions

The quality bar and the shared conventions for every repository under github.com/dhilipsiva. Each repository's README links this file and names its one local gate command. Decisions behind these rules are recorded in [DECISIONS.md](DECISIONS.md). A repository's own ruling (for example a CLAUDE.md ruling in rights-nobody-has-to-earn) wins over this file where the two disagree; record the exception there.

## Core floor (C1-C12)

Every kept software repository clears these. Items marked *[from first tag]* are required from a repository's first release, not assumed before it.

- **C1** The README states purpose, current status (first line) and how to build, run and test; the GitHub description says the same.
- **C2** LICENSE files and a `license` field in every manifest, with one consistent copyright holder (see "Licence policy").
- **C3** Reproducible toolchain: the lockfile is committed; a `flake.nix` dev shell wherever tooling goes beyond cargo; a fresh clone builds on NixOS with the documented steps.
- **C4** One documented local gate command (`just ci`, a script, or `nix flake check`) running fmt, lint and tests.
- **C5** `cargo fmt --check` and `cargo clippy --all-targets -- -D warnings` clean on the pinned toolchain (Nix: nixfmt, deadnix, ruff; TypeScript: tsc and eslint).
- **C6** Tests exist and run in CI. External services are gated with a loud skip or a service container, never a silent pass. No hard-required host binaries.
- **C7** `ci.yml` exists and is green on the default branch, with actions pinned to commit SHAs (see "Action pinning").
- **C8** A dependency advisory gate: `cargo deny check advisories bans licenses sources` with a committed `deny.toml` (`npm audit` for JavaScript) and zero unaddressed advisories *[from first tag]*.
- **C9** Agent guidance accurate to the real layout and commands: a short AGENTS.md; a CLAUDE.md only where there is a long operating context.
- **C10** A tracker or decision record that is current with the git log.
- **C11** Claims match code: README and metadata describe what exists; unbuilt features are labelled planned.
- **C12** Hygiene: a clean working tree, no committed build artifacts or bulk data, no machine-specific paths or WSL wrappers, merged branches deleted.

## Category lists

A repository adds the list for its category on top of the core floor.

**crates.io library** (nibli, dex-parser-analyzer; botwork, since it publishes a crate):
- L1 crates.io metadata on every publishable crate, `publish = false` on internal crates, and a release check that enforces it.
- L2 CHANGELOG.md in Keep a Changelog form, with `[Unreleased]` rolled at every release.
- L3 A tag-triggered `release.yml` that reuses `ci.yml` as its gate, with checksums, the crates.io publish and a RELEASING.md runbook; the live tag path exercised at least once.
- L4 docs.rs green for every library crate.
- L5 `rust-version` declared and built in CI *[from first tag]*.
- L6 Fuzz targets for every parser of untrusted input, time-boxed in CI.
- L7 A mutation baseline for soundness-critical paths, re-cut per release (manual by design).
- L8 An executable corpus with byte-exact expectations wherever there is a correctness contract.
- L9 Traceability from guarantees to tests.
- L10 Semver discipline: tags, a GitHub Release with checksums, a deprecation policy, version numbers never reused.
- L11 No reachable panic on untrusted input in library code.

**CLI tool** (botwork, wasi-warden):
- T1 A `--help` reference and a documented exit-code policy.
- T2 Release binaries for the supported OS matrix with SHA256SUMS (and provenance).
- T3 At least one install channel that works end to end (`cargo install`, `nix run`, a release asset).
- T4 Integration tests that drive the binary with exact stdout and exit-code expectations.
- T5 The trust model of whatever the tool executes is documented and enforced (sandbox limits, allowlists, budgets).

**Service** (sme-suite; diskev and rustymail on their revival paths):
- S1 A configuration schema documented and matching the code defaults.
- S2 Authentication and authorization enforced in every handler, with negative tests.
- S3 Integration tests against a real store in CI (a service container), failing loudly when the store is absent.
- S4 A deployable artifact (container or Nix package), a health endpoint that checks dependencies, and an explicit migration step.
- S5 Structured logs with request ids and a metrics endpoint.
- S6 A TLS story, restricted CORS, a CSRF stance, rate limiting, secure cookies and no insecure defaults.
- S7 Release tags and published images or binaries.
- S8 Deployment and operations docs.

**Desktop or web app** (EduStages, api-client; webrtc-rust-native-gui on its revival path):
- W1 Builds in CI for the real target (wasm32 or the GUI runtime libs), not only a native stub.
- W2 A deploy workflow (Pages for web; packaged binaries for desktop).
- W3 An automated UI-level smoke test (wasm-bindgen-test, Playwright, React Testing Library or a headless loopback).
- W4 A live URL or screenshot in the README.
- W5 A documented CDN/offline stance.
- W6 Persistence of user state verified by a test.

**Game platform** (uniblox; W1-W6 also apply):
- G1 Netcode invariants machine-checked (a net-free standalone crate graph, mode proofs).
- G2 A browser end-to-end test on a non-WSL CI runner.
- G3 Sandbox hardening gates for user content (watchdog, budgets, feature assertions, an adversarial corpus).
- G4 A legal and moderation plan recorded before any public publish (name screen, UGC obligations).
- G5 Dependency currency for pre-1.0 engines (Bevy, str0m), with a documented pin reason when behind.
- G6 An ADR log.

**ML research** (only on a revival path; the bar is research-credible, not production):
- M1 Every number in the README is measured and reproducible.
- M2 Pinned dependencies, scripted data and model acquisition, a config file.
- M3 A correctness test against a reference implementation (golden logits or parity).
- M4 A CPU or small-config path so `cargo test` and CI exercise the model without a GPU.
- M5 A benchmark harness with recorded numbers on named hardware.
- M6 Model and data licensing recorded; a model card or an explicit "weights not distributed".
- M7 Research reports under `docs/research/` with a provenance index, kept separate from the design doc.

**Infra config** (NixOS):
- I1 `nix flake check` green in CI.
- I2 nixfmt, deadnix and ruff.
- I3 Unit tests for scripts.
- I4 VM tests for login, secrets and socket activation.
- I5 Secrets never in git, with a structural checker enforcing recipient isolation.
- I6 Runbooks per host, with acceptance records.
- I7 Pinned inputs reachable from the upstream's default branch.
- I8 Drift-prone docs (version tables) generated from source.
- I9 Action refs pinned to SHAs.
- I10 The unattended update pipeline observed healthy (nightly success recorded, failures surfaced).
- Nothing switches or reboots automatically; changes are staged only, and the owner reboots.

**Book or content** (rights-nobody-has-to-earn):
- B1 Executable pins verified by a script, with each run (date, engine sha, counts, time, memory) recorded for the current source.
- B2 Clean-checkout reproducibility, with LFS and the engine pin documented.
- B3 Licensing per layer, with SPDX headers where layers mix.
- B4 An immutable edition (an annotated tag plus release artifacts).
- B5 CI runs the verifier and the tests, not only the UI build.
- B6 Generated reports regenerated and checked by a test.
- B7 A contributor path.
- B8 Decision records and an ordered tracker.
- B9 Independent validation of the content, or a recorded deferral.

**Grammar** (tree-sitter-nibli, inside nibli):
- GR1 `grammar.js` tracks the normative pest grammar, with a keyword-parity ratchet against the reserved words.
- GR2 The generated `src/` committed, with a generate-and-diff CI step.
- GR3 `test/corpus` covers every rule and the documented hazards, negatives included; CI fails on an empty corpus.
- GR4 Queries (highlights, injections, locals, folds, indents) present and exercised.
- GR5 Bindings pruned to those that build and test in CI, with ABI versions aligned.
- GR6 README, LICENSE and manifest metadata point at the right location.
- GR7 Editor integration verified (the Helix grammar build in CI).
- GR8 Release: a tag plus crates.io, npm and wasm artifacts.

**Research notes and decision records** (this repository). Core C1, C2 and C9-C12 apply; C3-C8 do not.
- R1 An index README with provenance per document (assistant, date, question, recommendation, status).
- R2 A decision record naming the chosen thesis and the rejected alternatives.
- R3 No misleading code scaffold.
- R4 A licence for the content.
- R5 Cross-links to the repository that implements each idea.
- R6 Binary documents converted to text, or frozen under `docs/original/`.
- R7 Archived once the decision record lands, unless work continues; this repository continues as the decision home.

## Archive floor

The smallest definition of done, for every repository that is archived:
- an honest README whose first line is a status banner (what it was, when, why it stopped, and where the successor or the idea note is);
- LICENSE-MIT and LICENSE-APACHE with the owner's name, plus a manifest `license` field;
- the GitHub description corrected to match;
- an idea note or pointer deposited in `products/docs/ideas/`;
- the GitHub archive flag set, and the local clone's `git status` clean.

## Explicitly not required below flagship scale

Requiring these on small repositories produces stale files, not quality:
- A CLAUDE.md + AGENTS.md pair at flagship size, or per-crate CLAUDE.md files. One accurate AGENTS.md of about a page is the bar.
- Lucy D peer files outside the three peers (nibli, NixOS, rights-nobody-has-to-earn).
- A large Justfile. A single crate needs `check`, `test`, `ci` and maybe `release-dry-run`. The requirement is one documented gate command, not a Justfile.
- Mutation testing outside soundness-critical cores. Fuzzing with a pinned nightly outside parsers and decoders of untrusted input. Multi-runtime determinism corpora; everyone else needs golden tests.
- Generated traceability indexes and per-feature evidence JSON. Scored AI reviews, a 9.5+ rubric and a usability study belong to botwork's own 1.0 rubric and do not leak into other repositories.
- Per-file SPDX headers (outside rights-nobody-has-to-earn). The LICENSE pair plus the manifest field is the bar.
- A Nix flake for a three-line scaffold. Multi-platform release matrices and many distribution channels before there is a user: a library needs crates.io plus a GitHub Release, and a CLI needs one working channel. An mdBook site for a library, where docs.rs plus the README is the bar. A CHANGELOG for anything unreleased; one is required from the first tag.
- Roadmaps disproportionate to the code. Research dumps in `docs/` without a provenance index. Tracked machine-specific agent configuration.
- Bulk artifacts in the tree: prohibited everywhere.

## Licence policy

Ruled in D2 (2026-10-21):
- Every repository is dual-licensed MIT OR Apache-2.0: two files, `LICENSE-MIT` and `LICENSE-APACHE`, copied from [templates/](templates/), plus the manifest field `license = "MIT OR Apache-2.0"` (in `package.json`: `"license": "MIT OR Apache-2.0"`). This repository's notes included.
- One copyright line everywhere: `Copyright (c) <first year>-<current year> dhilipsiva`.
- Exception: rights-nobody-has-to-earn keeps its layered licences (CC0 at the root, MIT + Apache-2.0 for code, CC-BY for text) under its own rulings.
- Per-file SPDX headers are a rights-nobody-has-to-earn practice only.
- Text quoted from third parties in the research reports keeps its own terms.

## Identity

Ruled in D3 (2026-10-21):
- Everything lives under github.com/dhilipsiva. The FossRust, FoRust, forust and Nitimis names are retired from licences, crate metadata, GUI titles and README links.
- crates.io and npm names become permanent at the first publish. Verify a name is free through the registry API on the day of the first publish, and prefer a project-specific prefix over a generic name.
- Chosen names: dex-parser-analyzer publishes `dexpa-core`, `dexpa-analysis` and `dexpa-cli` (binary `dexpa`); uniblox keeps its name unless the trademark screen before its first publish fails.

## Deny policy

- Every Rust repository commits a `deny.toml` copied from [templates/deny.toml](templates/deny.toml) and runs `cargo deny check advisories bans licenses sources` in CI.
- Advisories deny by default. An open RUSTSEC id may be ignored only with a comment naming the work item that closes it and an expiry no later than 90 days after the commit. An ignore without both is a CI failure in review.
- The deny job may start non-blocking while ignores exist. It becomes blocking when the ignore list is empty, and it never goes back.
- Licences are allow-listed (MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, Unicode, Zlib, MPL-2.0; CC-BY-4.0 only where prose is vendored). Sources are crates.io plus explicitly allowed git URLs.
- JavaScript repositories run `npm audit --audit-level=high` in CI instead.

## Action pinning

- Every `uses:` in a workflow names a full 40-character commit SHA followed by the release tag as a comment, for example `actions/checkout@<40-char sha> # vX.Y.Z`. No `@main`, `@master` or bare tag references.
- This is required wherever a secret, a deploy key or a publish token is in play (C7, I9), and is the default everywhere else.
- Dependabot (or Renovate) keeps the pins current with a `github-actions` entry. A pin is never moved by hand to an unreviewed SHA.

## wasmtime floor

- One wasmtime major across the portfolio: botwork's 49.x line, at 49.0.4 or later (the advisory floor).
- New hosts reuse botwork's host pattern (`src/core/eval/imports/wasm.rs`: fuel, a memory cap, epoch interruption) rather than re-deriving it.
- A repository that cannot move yet records the pin and the reason in its decision log, with a closing item, like a deny ignore.

## MSRV policy

- Every Rust workspace declares `rust-version` in `[workspace.package]`, and CI builds on it.
- `rust-version` equals the stable toolchain CI uses at the time of the release tag. It moves forward deliberately, with a CHANGELOG line, never silently.
- New code uses `edition = "2024"`. Flake dev shells pin the same toolchain through rust-overlay.

## Templates

Canonical copies live in [templates/](templates/). Copy them; don't re-derive them. Each is produced by the backlog item named here.

| File | What it is | Item |
|---|---|---|
| `templates/deny.toml` | the cargo-deny policy above | P0-INFRA-03 |
| `templates/ci-rust.yml`, `templates/ci-nix.yml`, `templates/ci-node.yml` | `ci.yml` for a plain Rust repository, for a flake repository (`nix develop -c just ci`), and for Node | P0-INFRA-04 |
| `templates/release.yml`, `templates/RELEASING.md` | the tag-push release workflow and its runbook skeleton | P0-INFRA-05 |
| `templates/flake.nix` | a Rust dev shell with the wasm targets | P0-INFRA-06 |
| `templates/Justfile` | `check`, `test`, `lint`, `deny`, `ci`, `release-dry-run` | P0-INFRA-07 |
| `templates/LICENSE-MIT`, `templates/LICENSE-APACHE`, `templates/workspace-package.toml` | the licence pair and the `[workspace.package]` metadata snippet | P0-INFRA-08 |
| `templates/AGENTS.md`, `templates/CLAUDE.md` | the one-page agent guide and the optional operating-context file | P0-INFRA-09 |

## Toolchains: what `nix develop` supplies and what the workstation must

What each repository needs beyond cargo/rustc. The table is the assessment's reading of 2026-10-20 and is **unverified until P0-INFRA-11** re-runs `nix develop -c <tool> --version` in each flake repository and dates the result here.

| Repository | Flake supplies | Workstation must supply |
|---|---|---|
| nibli | just, cargo-component, the wasm32 targets, Vampire, clingo, Lean, Python <= 3.13 | nothing (tree-sitter CLI and node are not in the flake yet) |
| NixOS | sops, age, ssh-to-age, nixfmt, deadnix, ruff, nvd | KVM/QEMU for the VM checks |
| rights-nobody-has-to-earn | no root flake (`ui/shell.nix` only) | git-lfs, wasm32-unknown-unknown, wasm-bindgen-cli 0.2.128, uv |
| botwork | no flake | rustup-style stable and nightly, musl and wasip2 targets, cargo-llvm-cov, cargo-mutants, cargo-fuzz, tree-sitter-cli, Node, Python, Playwright |
| tree-sitter-nibli | no flake | tree-sitter CLI 0.25.x, cc, cmake, make, node, python |
| uniblox | rust-bin stable with wasm32, wasm-bindgen-cli 0.2.121, coturn, redis-server | nothing |
| dex-parser-analyzer | wasm32-unknown-unknown, trunk, binaryen, wasm-pack | nothing (fuzzing gets its own dev shell) |
| sme-suite | just, cargo-watch, sea-orm-cli | Docker for PostgreSQL 17 |
| wasi-warden | rust-overlay 1.91.1 with wasip2 (EOL nixpkgs) | chromedriver, an OpenAI-compatible endpoint |
| api-client | GUI runtime libraries (EOL nixpkgs) | a Wayland or X11 session |
| api-gateway | a template Rust dev shell | nothing |
| r3-engine | fenix, `-C target-cpu=znver5` | the wasm32 target |
| cognito | no flake | the CUDA runtime libraries |
| wasmai | no flake | wasm32-wasip1, WasmEdge with the WASI-NN plugin |
| EduStages | no flake | node and npm |
| crm, products, diskev, webrtc-rust-native-gui, rustymail | no flake | system cargo (rustymail's current lockfile also needs OpenSSL headers; products' conversions need pandoc and pdftotext) |
