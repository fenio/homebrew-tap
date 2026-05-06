class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.6/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "71ab357b3f101bbb92c7349cea408649e3e57041f2603c487fc2c9b877a56378"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.6/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "70b0a752c49c05c76b12877cd3d2f120874d763b4d72deb2c31426dbe32dad63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.6/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17441fc643fade3b4b5ee2065f8a9c6b2d6426d19c6396102d1506abab942122"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.6/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd085ace93636707796d624024aa61c9cc25e268efa9d91b7b8701e0b38524c0"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
