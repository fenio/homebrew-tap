class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.5/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "45c6b7fee9e7dd47ce477bf6e7178fe9f9a37304075f916653dc7193ada37f3c"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.5/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "2db7d1e274010b67266b5ce1d7d27754ca27f71ae5839f402cd0c3d010c589e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.5/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a4b370f7f772bf965865b8d5e8e4d919bd8ddf8e2c975fdef7962f468cebbf4"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.5/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef47feccaf3f95e8d48f04153169af18f93984b23be06da356294e1f3422417e"
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
