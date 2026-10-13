# Homebrew Tap

Custom Homebrew tap for my projects.

## Installation

```bash
brew tap fenio/tap
```

## Formulae

| Formula | Description | Install |
| --- | --- | --- |
| [furman-mcp](https://github.com/fenio/furman) | MCP server for S3 and SFTP operations | `brew install fenio/tap/furman-mcp` |
| [nasty-top](https://github.com/nasty-project/nasty-top) | Top-like TUI for bcachefs filesystems (Linux) | `brew install fenio/tap/nasty-top` |
| [terrarium](https://github.com/fenio/terrarium) | Kubernetes terminal dashboard for tofu-controller and Flux resources | `brew install fenio/tap/terrarium` |
| [wharf](https://github.com/fenio/wharf) | Windows 11 ARM VMs using QEMU and HVF (Apple Silicon) | `brew install fenio/tap/wharf` |
| [zod](https://github.com/fenio/zod) | SDL3 build of the Zod Engine | `brew install fenio/tap/zod` |

## Casks

| Cask | Description | Install |
| --- | --- | --- |
| [anylinuxfs-gui](https://github.com/fenio/anylinuxfs-gui) | GUI for mounting Linux filesystems (Apple Silicon) | `brew install --cask fenio/tap/anylinuxfs-gui` |
| [furman](https://github.com/fenio/furman) | Dual-pane file manager for macOS | `brew install --cask fenio/tap/furman` |

### anylinuxfs GUI: fresh installation

On an Apple Silicon Mac, explicitly tap the CLI's repository before installing
the GUI. Homebrew does not automatically tap third-party formula dependencies.
Review both repositories before granting trust; these commands trust only the
required formula and cask, not every package in either tap.

```bash
brew tap nohajc/anylinuxfs
brew tap fenio/tap
brew trust --formula nohajc/anylinuxfs/anylinuxfs
brew trust --cask fenio/tap/anylinuxfs-gui
brew install --cask fenio/tap/anylinuxfs-gui
```

`brew trust` is for current Homebrew versions that enforce tap trust. If an older
Homebrew reports it as an unknown command, omit the two trust commands or update
Homebrew. Never run `brew install` with sudo.

The CLI is installed by Homebrew's dependency resolver. The cask does not run
nested `brew tap` or `brew install` commands inside sandboxed installation steps.
The GUI fresh-install workflow verifies installation with neither the CLI nor
the upstream tap present initially, using a fresh trust store and the supported
Homebrew prefix on a disposable macOS runner.
