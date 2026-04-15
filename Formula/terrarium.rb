class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.1"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "099bf9b821175ea3465c310e638776821569319a422bfff22b77b627cf37c44e"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "a866e3a41de3d6032e5d4d147240059f70ff791a5bd181448c102f4424a51329"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5151bb7e7881c2b8dde18bbf83d1fa9577a3133f961f0a35456315710115d164"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.1/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68d330c4e42db225958090a0ccbe148e85a28e0822c9a86e719e9e12178066ba"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
