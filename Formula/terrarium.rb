class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.6/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "e5a9c741405fd7283279d2d82b990e3ef47766d81225403a4c7faf7af29959b3"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.6/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "c3bc45a5ba7443f4aa7abaefc149bb4e4c4ae695b0725d19cd3628e8dac85d28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.6/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96a53b88df360ef44284d9bdc505a14d69f5f4e60bb37ddf078d51f545df0fe4"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.6/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dea4505c997e15e38282577d1773b22849d9b440bca6e804a9f9b2892ac5dc92"
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
