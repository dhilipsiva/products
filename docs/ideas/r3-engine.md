# r3-engine: 1.58-bit ternary inference on CPU and WebAssembly

**Repository:** [dhilipsiva/r3-engine](https://github.com/dhilipsiva/r3-engine), README claims retracted, then
archived (D9 = a).

**The idea.** A BitNet-b1.58 (ternary-weight) inference engine: memory-map a bit-packed weight file, run
AND+popcount matrix products (scalar natively, SIMD128 on wasm32), and serve tokens on a single consumer CPU core
or in a browser without a GPU.

**What exists.** A single-crate spike (687 lines, five commits on 2026-01-26): a 64-byte-aligned mmap loader, the
popcount kernel, a weight converter that cannot yet produce a usable file, and a terminal chat UI. `docs/` holds
seven LLM-generated research reports under three earlier names (Ternaris, Septensor, Trinetix). The README's performance
figures and "100% safe Rust" claim are not backed by the code: there is no attention, MLP or normalization, so no
forward pass exists to measure.

**Why it was not pursued.** A correct BitNet forward pass is a research project of its own, and no ruled thesis
needs one. Ternary CPU/WASM inference stays an idea, with the reports in the repository as its starting point.
