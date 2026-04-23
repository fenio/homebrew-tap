class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.5"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.5/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "f0f497e6e51305057efd671543a96868547d6a8c91429c5bac4359feb702b348"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.5/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "e892244e97d7bbb7856d45f76b38b3893b732270eb7e7e592a0ced7116fac03b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.5/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b7d227b8ff470d5bebb31ecddc6f2769f7d348f54147174ddf8f2156bc7b774"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.5/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c513f2c9cda5c491e2eadf99b51f3d271a398c3a5e808d7041bf390795b1050"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
