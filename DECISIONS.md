# Decisions

The decision record for the repositories under github.com/dhilipsiva. Each entry is dated and names the ruling, and whether it took the default the portfolio plan proposed. Later rulings are added as new dated entries; earlier ones are never rewritten. The cross-repository backlog that carries these decisions out is kept in the owner's workspace, not in this repository.

## ADR-0001: Product thesis

- Date: 2026-10-21
- Status: accepted (decision D5 below)

**Context.** This repository holds six strategy documents written with LLM research assistants between April and July 2025: the April 2025 comparison in README.md and five reports. They point at three incompatible first products: an SME suite starting with CRM, DevOps and secure-API tooling, and AI/Wasm infrastructure. None of them evaluates botwork or nibli, which is where most of the work actually went. Their market and pricing figures are LLM-synthesised and unverified.

**Decision.** All three theses stay alive, each with one vehicle repository. The flagships (nibli, botwork, rights-nobody-has-to-earn) continue alongside them.

- A. SME suite, starting with CRM: **sme-suite**, a single-tenant, self-hosted CRM MVP with a minimal Leptos web UI (D6). crm stays open as a pointer to it (D17).
- B. Developer and API tooling: **api-client**, a Floem desktop API client (D11). api-gateway is archived, and its two surveys move here as idea notes.
- C. AI and Wasm tooling: **wasi-warden**, the WASI-sandboxed agent host, as a standalone product (D7). wasmai's model router and telemetry ship inside its v0.1.0 (D8). Local inference uses existing OpenAI-compatible servers, so r3-engine and cognito are archived (D9).

The order the work runs in is recorded under "Work order" below.

**Alternatives not pursued, by document:**

- README.md, April 2025 comparison: ERP, help desk (its second pick), email marketing, project management and bug tracking, HR/ATS, git hosting and APM. They aren't pursued because CRM was taken instead and there is no capacity for a second SME product.
- "Profitable Rust B2B Products" (Gemini, June 2025):
  - Turbo-Runner (its first pick), Artifact-Cache and DevOps-Monitor: botwork already carries the owner's automation work, and there is no capacity for a CI product.
  - Flow-Core, Stream-Mux and Data-Validator: no data-engineering code exists in the portfolio.
  - Gatekeeper, Compliance-Bot and Zero-Proxy: api-gateway is a 69-line scaffold and is archived; its surveys are kept as idea notes.
  - This report also calls CRM "heavily saturated", which is noted here as the main risk to thesis A.
- "High-Leverage Open Source Product Ideas (Rust-Based)" (ChatGPT Deep Research, June 2025): team chat, unified observability, knowledge base, ATS, a project tracker, and the dev-collaboration suite built from them. Each is a crowded category with no code in the portfolio.
- Compass research export (Claude, June 2025): real-time data processing/analytics or CI/CD tooling first, monitoring second. No code exists for either, and there is no capacity.
- "AI Web3 Wasm Rust Intersection" (Gemini, July 2025):
  - DeAI PaaS, on-chain AI attribution, a LangChain for DeAI agents, and the Notary reference implementation: each depends on Web3 platforms with no work here.
  - The Wasm-native serverless AI-inference cloud is not pursued as a cloud; part of the "WASI-AI toolkit" idea is carried by wasi-warden (thesis C).
- "Opportunities at the Intersection of AI/ML, Web3, WebAssembly, and Rust" (ChatGPT Deep Research, July 2025):
  - Not pursued: the Wasm cloud/edge platform, decentralized AI services, confidential computing on Enarx, and multi-chain developer tools.
  - Kept only in part: AI model serving, through wasi-warden's routing to existing servers.
  - Out of scope for this record: the career section.

**Revenue goal and constraints, as the reports state them.** These are recorded, not adopted or re-dated, here; the quarterly review decides what to do with them.

- Revenue: roughly 1 crore INR (about USD 120k) per year by the end of 2027.
- Working conditions: solo, 30-40 hours a week, zero marketing budget, an open-core model.
- The Claude export's MRR milestones: from USD 1k at months 6-12 to USD 100k+ at months 36-48.
- The Gemini roadmap: 2025 an open-source MVP and 100 stars; 2026 a hosted SaaS and a second product; 2027 a suite and enterprise contracts. The 2025 and early-2026 milestones have already passed.

**Consequences.** Three products plus the flagships exceed one person's yearly capacity, so the plan runs for roughly two years. ADR-0001 is reviewed at every quarterly portfolio review, first on 2027-01-20.

## Owner rulings, 2026-10-21

Recorded in the owner's decision session of 2026-10-21. Each entry names the option chosen. "Default taken" says whether the ruling matches the default the portfolio plan proposed.

### D1. Where Lucy D lives
- Date: 2026-10-21
- Ruling: (a), then (b). The Rust desktop runtime merges onto nibli main, and NixOS re-pins in the same window. After nibli 0.2.0 ships, Lucy moves to its own repository.
- Default taken: yes

### D2. Licence policy
- Date: 2026-10-21
- Ruling: (b). MIT OR Apache-2.0 in every repository, including this one. rights-nobody-has-to-earn keeps its existing layered licences under its own rulings. One copyright line everywhere: dhilipsiva. Relicensing rests on dhilipsiva being the only author of every commit in the affected repositories (checked on 2026-10-21) and on FossRust and Nitimis being dhilipsiva's own names (confirmed by the owner).
- Default taken: no (the default was (a), which kept MIT on tools, apps and configs)

### D3. Identity and names
- Date: 2026-10-21
- Ruling: (a). The FossRust, FoRust, forust and Nitimis brands are retired; everything lives under github.com/dhilipsiva. dex-parser-analyzer's crates publish as `dexpa-core`, `dexpa-analysis` and `dexpa-cli` (binary `dexpa`). All three names were free on crates.io on 2026-10-21 and are re-checked before publishing.
- Default taken: yes, with the crate names chosen

### D4. Personal data and misleading stubs
- Date: 2026-10-21
- Ruling: (a). Personal records move out of the public nibli and rights-nobody-has-to-earn trees at the Lucy split. History is not rewritten. Stub repositories stay public, with honest status banners.
- Default taken: yes

### D5. Product thesis and the decision home
- Date: 2026-10-21
- Ruling: theses A, B and C are all alive (ADR-0001). This repository is the decision home.
- Default taken: no (the default was (D): park every thesis)

### D6. sme-suite
- Date: 2026-10-21
- Ruling: (a), invest. A single-tenant, self-hosted CRM MVP with a minimal Leptos web UI. Hardening comes before any deployment.
- Default taken: no (the default was to park it)

### D7. wasi-warden
- Date: 2026-10-21
- Ruling: (c), a standalone product.
- Default taken: no (the default was to archive it)

### D8. wasmai
- Date: 2026-10-21
- Ruling: (b), folded into wasi-warden. Its model router and telemetry schema ship in wasi-warden v0.1.0; wasmai is then archived with a pointer.
- Default taken: no (the default was to archive it as research notes)

### D9. Neural-model work
- Date: 2026-10-21
- Ruling: (a). r3-engine and cognito are archived with honest READMEs; their docs are kept.
- Default taken: yes

### D10. uniblox
- Date: 2026-10-21
- Ruling: (A). A netcode library plus a hosted demo. The name is kept, and a trademark screen runs before the first publish.
- Default taken: yes

### D11. api-client and api-gateway
- Date: 2026-10-21
- Ruling: (b) for api-client: build the Floem desktop MVP. api-gateway is archived, and its surveys move here as idea notes.
- Default taken: no (the default was to archive both)

### D12. EduStages
- Date: 2026-10-21
- Ruling: (a), finish a trimmed v0.1.0.
- Default taken: no (the default was to archive it)

### D13. The tree-sitter grammar
- Date: 2026-10-21
- Ruling: (a). The grammar is built inside nibli at `editors/tree-sitter-nibli`. The standalone repository is archived with a pointer; there is no mirror.
- Default taken: yes

### D14. The `.nibli` dialect
- Date: 2026-10-21
- Ruling: (b). Grammar v0.1's corpus gate covers pure-KR files only. A directive rule for session scripts is a recorded follow-up.
- Default taken: yes

### D15. rights-nobody-has-to-earn edition mechanics
- Date: 2026-10-21
- Ruling:
  - The Book 1 edition tag comes first.
  - The constitution stays in Git LFS, with a guard.
  - Publisher submissions and independent lay-reader validation are deferred on record, to be revisited on 2027-01-20.
  - The Lucy interaction records move out with D4.
- Default taken: yes, with the revisit date set

### D16. botwork 1.0
- Date: 2026-10-21
- Ruling:
  - 0.3.0 ships first.
  - The 1.0 gates stay as written. The usability study can be revised by a recorded decision entry, but only if it is the last gate still open.
  - The licence becomes MIT OR Apache-2.0 before 1.0 (D2).
  - `rust-version` is declared as the CI stable at tag time.
- Default taken: yes, except the licence (the default kept MIT)

### D17. Archive batch 1
- Date: 2026-10-21
- Ruling: none of the four is archived. crm stays open as a pointer to sme-suite. diskev, rustymail and webrtc-rust-native-gui stay open as future products, with revival work scheduled after api-client.
- Default taken: no (the default was to archive all four)

## Other recorded choices

### Evidence and backlog history (P0-INFRA-10)
- Date: 2026-10-21
- Choice: the cross-repository backlog and its 2026-10-20 assessment evidence stay private in the owner's workspace, as a local git repository that is never pushed.

### Work order
- Date: 2026-10-21
- Choice: repositories are worked one block at a time. Each block runs through all of its non-maintenance work before the next one starts. The order:
  1. the shared templates
  2. dex-parser-analyzer
  3. uniblox
  4. products
  5. wasi-warden, with wasmai
  6. nibli, NixOS and rights-nobody-has-to-earn together
  7. botwork
  8. tree-sitter-nibli
  9. EduStages
  10. sme-suite
  11. api-client
  12. the r3-engine, cognito and api-gateway archives
  13. crm, then the diskev, rustymail and webrtc-rust-native-gui revivals
