class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.1/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "eac0a324c72a6e23c420876c9fad5fe4fa029ce0afdac42c51d2664f31de9462"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.1/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "48c9900e8714aa6fd7e0cbf7ff49fa84bbb1fe0a05954a6491c31a9a2a224c3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.1/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d04c538a3e389fa87cad0e65fae97819f195b22f972f227a3eb12e3a592cf6f"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.1/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2a6ded018d3f59452d57626eefae7db88f24e89f232d6f6a9b2738ce9d5b0ee"
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
