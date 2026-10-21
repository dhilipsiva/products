# cognito: a small GPT in Rust on Burn

**Repository:** [dhilipsiva/cognito](https://github.com/dhilipsiva/cognito), archived (D9 = a).

**What it was.** A two-day experiment (2025-12-25/26) training and chatting with a small GPT-2-style decoder in
Rust on the [Burn](https://burn.dev/) framework, CUDA backend: about 513M parameters, trained on TinyStories, with
a REPL sampler. The README described a far larger "reasoning-dense" agent (special tokens, RoPE, SwiGLU,
FlashAttention, 1.5-3B parameters) that the code never was.

**What was learned.** The attention mask is inverted: Burn fills the `true` positions, and the mask is `true` on
and below the diagonal, so each token attends only to later tokens. Inference also runs with dropout on and a
near-random sampler, so no run produced evidence about anything. A correct small GPT in Rust would be written
fresh; the existing code has no salvage value beyond familiarity with Burn's API. One shape-level unit test on a
CPU backend would have caught the mask.

**Why it was not pursued.** The neural cluster had no runnable model, and "reasoning without hallucination" is
nibli's slot. The idea survives as a possible educational project, not a product.
