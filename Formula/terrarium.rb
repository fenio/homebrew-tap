class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.0.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.4/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "dd7c720c4a11fe7360d96b59e81b333bdee64be74afb29c4aeb21941653007bd"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.4/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "9526dd1fa30ec1ab56b748a91b095b1652eaaa15d74fcccbce6b5317430afcd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.0.4/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3159b2d7e1c89c63ce855763690c983966c2806be036da88e2ebb1c5a3548b55"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.0.4/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbe510873a5c020173ee3c2b6aa257a92c9663109d60c644e17a9cdb676bfbe7"
    end
  end

  def install
    bin.install "terrarium"
  end

  test do
    assert_match "terrarium", shell_output("#{bin}/terrarium --help")
  end
end
