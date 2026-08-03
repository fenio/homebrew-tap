class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.2/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "929f1e2f0295cf6cedfce2a7b90b44034f87eff2b661c5430e1584d5bf32c93c"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.2/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "040531a4d26e1d038a6a340c297ce62c868eacb6a0b78f68ed42c24d4e0b8c9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.2/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59cb2c265645737e0c34d84576f69b5856dad49f9d1f06e5e249ca47ed53aa82"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.2/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2192a7badfe049ed635ad5e97e8fdd04f4e45324d7a2ea123ace7f4b00a52ca0"
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
