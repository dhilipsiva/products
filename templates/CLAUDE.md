# CLAUDE.md

<!-- Optional template (products/templates/CLAUDE.md): the longer companion to AGENTS.md. Fill every <…>,
     delete what does not apply, and keep facts the code already states out of it. -->

This file guides Claude Code (and other agents) in this repository.

## Project

<One paragraph: what it is, who it is for, the one idea that matters.>

## Current state (read this first)

- **Done:** <what works, with the decision IDs>.
- **Underway:** <what is in flight>.
- **Not built:** <what is stubbed or missing>.

Live status: <PROJECT_STATE.md or the tracker>. Reasons behind each design choice: [DECISIONS.md](DECISIONS.md).

## Invariants: do not "helpfully" break these

- <Each settled decision an agent might be tempted to undo, with why and the ADR.>

## Commands

```bash
nix develop               # the pinned toolchain (flake.nix)
just ci                   # the gate CI runs: fmt, clippy -D warnings, tests, cargo deny
just --list               # every recipe
```

<Anything non-obvious: tests that need a service on PATH, profiles not to test in, generated files.>

## Working rules

- Tests before the implementation for behavior changes; a fresh reviewer for anything security-critical.
- No `unwrap()`/`expect()` in non-test code; no new `unsafe` without a `// SAFETY:` comment.
- Branch per change; never push, tag, publish or release without the owner.
- <Repository-specific rules.>
