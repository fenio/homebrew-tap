class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.0/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "05add22e9941d6f6449f9764ea2a3d22f1fa74a0f64fd406aaa26cf852d34c85"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.0/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "6250925dd2ac2ce53ca775ca22a0b68c5bd062684f71cd0463dbc8fa834442ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.0/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73c13e2910b783d6e043e925a9c76b1995e8b938daae2d0bda7d17b5c4253daa"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.0/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce68c1f60884a8eb8b8edbaa3f640ac0a35c7a35b05fed23631fdb4806253716"
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
