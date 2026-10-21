# Releasing <FILL: repository name>

<!-- Skeleton from github.com/dhilipsiva/products/templates/RELEASING.md. Fill every FILL, delete
     what does not apply, and keep this file true: the release workflow and this runbook change in
     the same commit. -->

## Which form to copy when

Copy `templates/release.yml` as it stands for a plain cargo repository that ships crates and, optionally, binaries (dex-parser-analyzer, wasi-warden, sme-suite, uniblox). If the release logic is substantial enough to deserve local rehearsal (per-crate publish order, generated assets, a WASI component, docs links), keep the workflow as wiring and move each step into a `just release-*` recipe run inside a dedicated `nix develop .#release` shell. That is nibli's `release.yml`; copy it instead and rename its recipes. A CLI that ships through several package managers takes the optional channel jobs at the end of the template, modelled on botwork's `release.yml`: each channel skips loudly when its credentials are absent. Never start with more channels than there are users: a library needs crates.io plus a GitHub Release, and a CLI needs one working install channel.

## What a release is

- Channels: <FILL: crates.io (crate list below), GitHub Release with binaries and SHA256SUMS, ...>
- Crates to publish (the `CRATES` value in `.github/workflows/release.yml`; cargo orders them by dependency): <FILL>
- Binary and targets (the `BIN` value and the `build` matrix): <FILL, or "none: library only">
- Secrets: `CARGO_REGISTRY_TOKEN` (crates.io, publish-update scope on exactly these crates, with an expiry) <FILL: any channel secrets>

## Before tagging

1. CI is green on `main` for the commit you will tag.
2. Bump the version in `Cargo.toml` (`[workspace.package] version`). The tag must equal it; the preflight refuses a mismatch.
3. Roll `CHANGELOG.md`: rename `[Unreleased]` to `[X.Y.Z] - YYYY-MM-DD` and open a new empty `[Unreleased]`. The release notes are that section, and the preflight refuses a tag without it.
4. `cargo publish --dry-run --locked --workspace` passes locally.
5. Rehearse: run the Release workflow by hand (Actions, Release, "Run workflow"). A manual run is always a dry run. It builds every binary, writes SHA256SUMS, renders the notes and dry-runs the publish, and creates nothing.

## Cutting the release (the owner)

```sh
git switch main && git pull --ff-only
git tag -a vX.Y.Z -m "<FILL: name> X.Y.Z"
git push origin vX.Y.Z
```

The workflow then runs preflight -> CI -> binaries -> a draft GitHub Release (checksums, build provenance) -> crates.io -> undraft. The publish is the only irreversible step, and it runs last.

## If it fails

- Before `publish`: fix the cause on `main`, delete the tag locally and on the remote, and tag again. Nothing has shipped.
- During or after `publish`: never re-tag or reuse the version. A crates.io version is consumed forever, yanked or not. Use GitHub's "Re-run failed jobs" on the same run. If a crate must be withdrawn, `cargo yank`, then release X.Y.Z+1.
- An expired or revoked token fails fast at "The crates.io token is live", before anything is published.

## After the release

- docs.rs: check each crate's build page (`https://docs.rs/crate/<crate>/X.Y.Z/builds`) within a few hours.
- The launch note (what works, known limits, how to report problems) goes in the GitHub Release body, stating only measured claims.
- Update the workspace index and the decision record if the release changes a repository's status.
