class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.3/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "f0548f9e9f5bb348f84c01c1ad982848131a167f0c8a115df0a0bfd9d9f133fd"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.3/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "6ac602487e2c7a71cbe023cdd9d50f9318e65f352a8c4acc8d4b8e338f7324d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.3/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "012d6f36ac828b97ff9a337c9498fa6178f130e4eaf6e33c0df0bedb7fe7484b"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.3/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5bb90e4453496fd6f192e3f173dd00d9a34dde1e8c7f8ba1f57be784ac88556"
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
