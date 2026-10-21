# Links worth knowing

Projects the research pointed at, with why each matters to this portfolio and which repository, if any,
builds on it. Every link was checked on 2026-10-21; the CI link check (`.github/workflows/ci.yml`) keeps them
honest.

| Project | What it is | Why it matters here | Adopted by |
|---|---|---|---|
| [matchbox](https://github.com/johanhelsing/matchbox) | Peer-to-peer WebRTC networking for Rust, in wasm and native. | The browser transport and signaling protocol under the game platform. | uniblox (`crates/transport`, and the signaling service's wire protocol) |
| [Burn](https://burn.dev/) | A Rust deep-learning framework that trains and deploys on many devices. | The Rust-native ML stack the neural cluster tried. | cognito (archived; its causal mask was inverted) |
| [wasmCloud](https://wasmcloud.com/) | Wasm-native orchestration across clouds, Kubernetes and the edge. | A reference for running Wasm services at scale. | wasmai's design notes (to be folded into wasi-warden, D8) |
| [Wasmer](https://wasmer.io/) | A WebAssembly runtime and container-style platform. | The main alternative to wasmtime, which the portfolio uses. | none: wasi-warden and api-client use [wasmtime](https://wasmtime.dev/) |
| [Spin](https://spinframework.dev/) | A framework for event-driven microservices as Wasm components. | The component-model service shape the WASI work follows. | none |
| [runwasi](https://runwasi.dev/) | A library for running Wasm workloads under containerd and Kubernetes. | How Wasm workloads enter existing container infrastructure. | none |
| [Kuasar](https://kuasar.io/) | A container runtime with multiple sandbox kinds, Wasm among them. | Sandboxing choices for hosted agents. | none |
| [Enarx](https://enarx.dev/) | Confidential computing with WebAssembly. | Isolation beyond the Wasm sandbox for untrusted workloads. | none |
| [AICI](https://github.com/microsoft/aici) | Prompts as Wasm programs that constrain LLM decoding. | A precedent for sandboxed, programmable LLM control. | none |
| [redshirt](https://github.com/tomaka/redshirt) | An experimental OS whose executables are all Wasm, loaded from a decentralized network. | The far end of "everything is a Wasm module". | none |
| [Turso](https://turso.tech/) | A SQLite-based database for apps and agents. | An embedded-database option for small self-hosted products. | none |
| [Cloudflare Workers](https://workers.cloudflare.com/) | Serverless code at the edge, with Wasm support. | The managed comparison for any edge-hosted service. | none |
| [ink!](https://use.ink/) | Rust smart contracts. | The Web3 thesis the research explored and the rulings did not pursue. | none |
| [CosmWasm](https://cosmwasm.com/) | A Wasm smart-contract platform across chains. | As above. | none |
| [NEAR](https://www.near.org/) | A blockchain positioned for AI agents. | As above. | none |
| [Astar](https://astar.network/) | A Web3 network and dApp platform. | As above. | none |
| [Holochain](https://www.holochain.org/) | An open-source peer-to-peer application framework. | Agent-centric P2P data without a global ledger, relevant to P2P designs. | none |
| [zkVerify](https://github.com/zkVerify/zkVerify) | A Substrate chain for verifying zero-knowledge proofs. | Proof verification as a service, in the Web3 thesis. | none |
| [CYFS](https://github.com/buckyos/CYFS) | A decentralized protocol stack upgrading TCP/IP, DNS and HTTP. | The Web3 thesis's most ambitious entry. Its website (cyfs.com) answered HTTP 502 on 2026-10-21; the repository's last push was in June 2023. | none |
