class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.1.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.2/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "7e2382b9bff3e799f180f569cdd2504a3198f3c09b9b438d45b2d1da6b40a038"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.2/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "82c9553a3c2e4d9181a795021d0baaa2bb2fc1d145446b5ee5a12ee19d449eff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.2/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cf3b3bf59707a0513aaba156f0a7a775599313bf6c61574b32725abbc076371"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.2/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d6b45a04cd7e10bce86f63fcaaeae90309cb187c1edab17cd4174044857c2c8"
    end
  end

  def install
    bin.install "terrarium"
  end

  def caveats
    <<~EOS
      Replan (R) and Break-the-Glass (x) shell out to tfctl. To use them,
      install tfctl from the upstream tap:

        brew install flux-iac/tap/tfctl

      Terrarium itself runs fine without tfctl — the rest of the TUI works,
      only those two actions require it. A startup warning appears when
      tfctl is not on PATH.
    EOS
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
