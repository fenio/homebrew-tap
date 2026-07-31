class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.1/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "6da793f7285e5ce39aaea17c94ee6135df85a9be4b0e776ae43b45319c8b6f19"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.1/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "a9ae7f2c80d841b109c93134a0c69b22823eae016023f04ab5c9b61968a75a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.1/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc77da039c433199151fb243956f9c25dae7db698def198ca4a00c9ced1ea1d6"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.1/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f9083e76e52322f96d135ddeda5030e3c476faacde459d5a2dfae68644bed40"
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
