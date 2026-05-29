class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.1.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.3/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "75def8dee12bf8431d3bef95e552905e2363ab3411045435d4fa6a1180a20a32"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.3/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "7ebe820bd3a1557588aeb1b0700acd6d8f9569a31b933151b4c91ed80340c9a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.1.3/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e14e16b1172fe7b39949307ed78d095638c65d57beea5b1c9e22dde35257be2"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.1.3/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10e2a07c67d294e9cf87380e41aa486171953570c59886e34b9601eaea0c905c"
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
