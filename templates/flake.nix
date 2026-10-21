# Dev-shell template for the portfolio's Rust repositories (CONVENTIONS.md C3). Copy it to the
# repository root as flake.nix, set `rustVersion` and the shell name, and keep or drop the optional
# tools. Cut from uniblox's and nibli's flakes.
#
#   nix develop          # cargo, clippy, rustfmt, rust-src and the wasm32 targets, plus just
#
# The toolchain lives in the flake, not in an ambient rustup: `nix develop` (or direnv's
# `use flake`) puts it first on PATH.
{
  description = "Reproducible dev shell (pinned Rust with the wasm32 targets)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };

        # An exact stable release, equal to `rust-version` in Cargo.toml (CONVENTIONS.md: the MSRV is
        # the CI toolchain at the release tag). Move both together, with a CHANGELOG line.
        rustVersion = "1.99.1";

        rustToolchain = pkgs.rust-bin.stable.${rustVersion}.default.override {
          extensions = [
            "rust-src"
            "clippy"
            "rustfmt"
          ];
          # The three wasm32 targets: the browser, WASI preview 1 and WASI preview 2 (components).
          targets = [
            "wasm32-unknown-unknown"
            "wasm32-wasip1"
            "wasm32-wasip2"
          ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "rust-dev";
          packages = [
            rustToolchain
            pkgs.just # the local gate (templates/Justfile)
            pkgs.cargo-deny # `just deny` (templates/deny.toml)
            # Optional, for WASI components; drop them if the repository builds none.
            pkgs.cargo-component
            pkgs.wasm-tools
          ];
          shellHook = ''
            echo "$(cargo --version) | $(just --version)"
          '';
        };
      }
    );
}
