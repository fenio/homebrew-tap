class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.7"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.7/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "24f82c6d4a4d3be438266e339bf5c9a5a42ab0a05362d5ae179963efde21aea8"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.7/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "10e0d0f952b99c163484be2ef04c5f6d5a7112dbd78dbf0e0a3eb74d3031c6d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.7/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6edb3b40b5ac8b0f84fba9560a8b28455818b5ca46c5dd29d936b1996f8e7ca"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.7/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30caa75965da3f457feacdad7968d1fbaed2df9079e381ddddd49b6742b36abd"
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
