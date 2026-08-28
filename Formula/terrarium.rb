class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.2/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "bd4341b11aaf78d753c3e04296151ed6f9ccf4ebe6816bddc2dfc57adaac0c5b"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.2/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "f3c101b201574299843a4318bb5bdfbbf3e9a08fc4be1e9ee863659570032a00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.2/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8485e38a07d1ffae187e0d6b9fec40764d3e51c6ceb2816189906e99363f5f37"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.2/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7cb0d6a06ccc273be33da99d70f142554c48ce887c0c9fd7d5968d94e1862a7c"
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
