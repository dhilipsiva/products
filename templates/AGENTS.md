# Working on this repository

<!-- Template (products/templates/AGENTS.md). Fill every <…>; keep it under one page. -->

Read [README.md](README.md) for what this is and how to run it, [CLAUDE.md](CLAUDE.md) (if present) for
the longer guidance, and [DECISIONS.md](DECISIONS.md) before changing anything a decision settled.

Layout: `<dir>/` holds <what>; `<dir>/` holds <what>. Build and run with <command>.

The gate is `just ci` (fmt, clippy with `-D warnings`, tests, `cargo deny`): run it before every commit, and
treat a red gate as unfinished work. The toolchain comes from `nix develop` (or direnv); never build with a
toolchain the flake does not pin.

Keep: <the invariants an agent must never break, one line each>.

Implement authorized work and its tests autonomously; commit on a branch, never on `main`. Do not push,
tag, publish, release or delete remote branches without the owner. Keep secrets outside Git and the Nix
store. Report what you could not verify (a credential, a device, a network) as unverified: a passing build
is not a working deployment.

Runbooks: <RELEASING.md>, <DEPLOYMENT.md>, <docs/…>.
