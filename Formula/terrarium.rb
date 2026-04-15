class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.1"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-aarch64-apple-darwin.tar.gz"
    sha256 "366637ef7e7aef329190dad0143cbb6373b6cbce2893a72145cf99d6b7b003b3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6feb81b524314b45b757f1eb3443e5c4141708ae39d8d62b32faaa1dda4a670b"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d9f8f8d20db6132babd3490144e71078fdfe9fba8f75477ef959e73d7aea05c"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
