class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.5/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "74de272773a10b7dc77c7f377cf6d2894d00dcb090a7d7fd9d58626a887b151a"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.5/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "e2b14cf2ec2979a9cdb57583ae7cdb3d400f327684f9401fd83dec8f6eeb7b28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.5/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f16a1229dea9a7d644c62b28502bd2e6388f4dff3e861ef1708daeac60e1c121"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.5/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd02b3025cfa53f6ea616e432596525426669b2c1d88bf5f001b1d13e80b2dfa"
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
