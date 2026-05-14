class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.1/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "2d8c1428f847ca4dc795f346aba139d3e4a7dd7b275163806de9f6b6715f2804"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.1/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "684419a6c7b3c26cfede14413da7c77cd11093f48364fd48992fa56fcba5f453"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.1/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ba468cf8febaeb56994aab5ee72c078037e0c04dec46dbc30d6bfc628635a56"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.1/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7028d713944eb65f8a4e04707012bc6e56edad28d7d7f122536fdeb3738853bd"
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
