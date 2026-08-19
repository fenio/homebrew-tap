class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.6"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.6/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "0c3cae308f31179ce2d520939c15593528e2520a3a0b481695fbb6cee5793ebc"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.6/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "4b34eced65ed4077ff7bf235627f59d90281427fc59cd14a3871b407ad1677ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.6/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfa0089fd2e12308e54bfb0ada9f7be5fb0bccebf2ba9541821f198e847ee58c"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.6/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2848e1d5af3480968d97aa1df86d81b9c8fa38e04a57e839b80db295ab98ce8a"
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
