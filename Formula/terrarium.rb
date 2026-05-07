class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.0/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "1d3303c4f84d8eee3c499d41ca81766d8674a4c1dc52553f793c34077df344ea"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.0/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "e3ee832df28b9e95bf3ead333f1ce9a26d31054d4c1d988913b3780c2269648f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.0/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75ee0f9a6eff1458ecb16e2600905e8fe4bbfc655a5b6fd7cfe5c5b520c5d6e5"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.0/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c6794fe06cbb76131f0c12f261445bb3dac6f4b4a805d1eaf77aa69b6f7b7d2"
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
