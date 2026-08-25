class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.0/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "297c38c6361953e332a957ffd6c192d2af5dd194e4d4a83ee3053521bf831cf7"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.0/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "fbad27b843d7284811f5bd9d1ee9f77262c6cf54372e7d94bd0c0d413737279e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.0/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "147466da293a351d685e5b22f6e6367c2831bca68aee12685262c92acd1f28cf"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.0/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e75466674dc3be39ed70db84d9e7297ebd50171305da327eed5ee7b46d51e5e8"
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
