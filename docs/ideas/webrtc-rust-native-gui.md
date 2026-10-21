# webrtc-rust-native-gui: design input for its revival

**Repository:** [dhilipsiva/webrtc-rust-native-gui](https://github.com/dhilipsiva/webrtc-rust-native-gui), kept open
as a future product (D17).

**What it was.** A two-day experiment (2024-06-29/30, 17 commits): an egui/eframe desktop window around a
webrtc-rs 0.11 peer connection, where two instances exchange SDP by copy and paste, to compare ICE through Google's
STUN servers with host-only ("ICE Lite") candidates. A second binary, `stun-server`, is a three-line placeholder.

**Why it never connected.** No data channel or transceiver is ever created, so the offer has no m-line, no ICE
credentials and no candidates, and the other side rejects it. The fix is one call (create a data channel before
the offer), but no commit ever made it. Two smaller faults sit behind it: the answer path sets the local
description twice, which panics, and the "ICE Lite" button only empties the STUN list instead of calling
`SettingEngine::set_lite`.

**What a revival starts from.**
- Open a data channel before creating the offer, set the local description once, and prove the exchange with a
  headless loopback test before any GUI work.
- The questions it asked (STUN against host-only connectivity, the offer/answer flow) are answered in
  [uniblox](https://github.com/dhilipsiva/uniblox)'s transport and signaling: matchbox and str0m, hermetic
  coturn STUN/TURN tests, and a signaling service. Reuse those findings rather than re-deriving them.
- Current dependencies (the lockfile dates from June 2024), a real STUN path and a flake, then a 0.1.0.
