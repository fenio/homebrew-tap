class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.8"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.8/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "adc239c257bb6137b832474d83cddce2bbd1040b43146d3d4526dd0fa6a2c2b3"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.8/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "fba881434913a2b21b96981b1d2f9cf7f9a6fd56486296ed0c3f1fb8f4e55143"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.8/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01e96d929b0fdd1e85fda2ef8d8b680ad3663457e06917563388284dd7ed62ef"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.8/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddd37facced413912651d755ce92281a386e56f83c70b6e89854104f1f02243c"
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
