# Homebrew Tap for Tactic Remote

Control Claude Code, Codex, Amp, and Droid from your iPhone or iPad.

## Install

The formula provides the compiled Tactic Remote 1.13.0 host for Apple Silicon/Intel macOS and ARM64/x64 Linux. Pair it with the iPhone or iPad app 1.13.

```bash
brew install TacticSpaceTech/tap/tacticremote
```

## Upgrade

```bash
brew update
brew upgrade TacticSpaceTech/tap/tacticremote
tacticremote --version
```

The version command should report `1.13.0`. A running host must be restarted to use the updated binary.

## Run

Install a supported agent CLI and complete its provider sign-in on this computer. The formula installs `tmux` and the platform binary; no separate Node.js runtime is needed for the compiled host.

```bash
tacticremote
```

Scan the QR code with the [Tactic Remote](https://tacticremote.com) iOS app to connect.

## More info

- [Website](https://tacticremote.com)
- [Setup Guide](https://tacticremote.com/docs/getting-started)
- [npm package](https://www.npmjs.com/package/tacticremote)

## License

The distributed host is proprietary software. The formula installs its license and bundled third-party notices alongside the binary.
