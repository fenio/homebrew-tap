class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.2/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "3e114b2191a524d623a0eeac745d941192becb124c3f7a2261702de9c3602324"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.2/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "f85dd66c8bf296839e8c8816ac09a4211988aa9f5b5a0b678227ad330d2944ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.2/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2837aa9674b08cbe112318b2d70703c2969b9cf364804c532003b1a072c5a459"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.2/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb694fcdedd2ffe836b5f7d979e1a5f84f063c133ffdf2f18d266966a52bc309"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
