# wasmai: a credit-aware coding agent with org-owned WASM inference

**Repository:** [dhilipsiva/wasmai](https://github.com/dhilipsiva/wasmai), folded into wasi-warden, then archived
(D8 = b).

**The idea.** Route coding-agent work across CPU, GPU and frontier models by cost, capture every session with
PII and secret redaction, and turn escalated sessions into training data, so routine work stops burning enterprise
API credits. Org-owned models would run as WASM (WasmEdge with WASI-NN).

**What exists.** A three-line `cargo new` scaffold, about 2.2k lines of LLM-synthesized research notes (a quarter
of it duplicated) and an 810-line, 256-item roadmap, untouched since the day it was created (2026-07-23).

**Where it lives now.** wasi-warden's v0.1.0 takes the LLM router (a frontier API plus a local OpenAI-compatible
endpoint, fallback, cost and latency accounting) and a versioned telemetry schema with redaction. wasmai's design
ideas move to `wasi-warden/docs/design/` with the fold, and its cost model is rewritten there: the only derivation
in wasmai's notes shows the hybrid CPU/GPU fleet costing more than GPU-only ($1,720 against $1,140 a month), and
reaches its 60% saving only by switching the baseline.
