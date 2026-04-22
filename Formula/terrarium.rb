class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.3/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "6df057ef5bf4bc1ae26c8899cdb7957b14668daa7c96bf1315f2d213180249b0"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.3/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "ff6ca52a70e0d6aece0bc98298ea6f56fb152dbd0cea622727d9c59388ec4fb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.3/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da36a84644dee51f4e85cefc11ce914d40d008cede51e9137aedd11af769f220"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.3/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18fbd605b93f863caac375955c2588ba1ee92a73a4778133d69281673cd3ad94"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
