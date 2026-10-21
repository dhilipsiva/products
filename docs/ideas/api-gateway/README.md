# api-gateway: a fast, low-footprint API gateway in Rust

**Repository:** [dhilipsiva/api-gateway](https://github.com/dhilipsiva/api-gateway), archived (D11). It holds a
69-line Hyper and Tower hello server (it answers `/hello`; nothing is proxied), written on 2025-06-01/02, two
weeks before the Gemini report below proposed the same product (its citations are dated 2025-06-16). The
report more likely reflects the started gateway than the reverse.

**The idea.** "Gatekeeper": an open-source, high-performance API gateway in Rust, focused on security and ease of
use. It is Product 1 of Arena 3 in the Gemini report [rust-oss-business-roadmap.md](../../rust-oss-business-roadmap.md)
(search for "Gatekeeper").

**The research, kept here from the repository's `docs/`.** Both are Gemini Deep Research surveys, committed on
2025-06-01 with their citations dated 2025-05-31 and 2025-06-01; the repository's last commit, "add gemini docs",
links the Gemini conversation from its README.

- [rust-api-gateway.md](rust-api-gateway.md): building a blazing-fast, low-footprint API gateway in Rust (was
  `docs/01-Rust-API-Gateway.md`);
- [ebpf-gateway-performance.md](ebpf-gateway-performance.md): eBPF for high-performance network processing (was
  `docs/02-aBPF-Gateway-Performance.md`).

**Why it was not pursued.** The rulings chose three theses (ADR-0001) and put API tooling in api-client's Floem MVP
instead (D11). A revival would first settle the framework: the survey recommends Axum, while the code uses raw
Hyper with a hand-written Tower service.
