class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.3/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "4842582f51d80652d5d204dcd8dc2111cabd21f0a32ebee87c21019abb2c9119"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.3/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "876b27675f2a1fa4b2ded2d5312a3e21f964687e902703a71f87ba4d49714d59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.3/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1fb3b62e510b2d61fe729d6f2529596f54e2855bcc3c7f8a2affb3c97a66c0e"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.3/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbe16dae7ce7ea13b176ccb03249a1c3236430b7a3e37a09c1329baf0f720f61"
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
