class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.4/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "7d76aac1b11cbfb6b1783262e47318fbba6208baaf43f8457df8b0264f8a3e9b"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.4/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "1d9d0ba3e199efe0eae9739125290d26655ef291fd0181b81bb6b3522843df6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.4/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57ca8dc6e4b39178310422fa5f5417a1268ea7364139098f175e07562afc8c02"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.4/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f1d431f90ddb4adbf5e34c66885058a03d49b4d9f4bc66f98ed84b90ee873ac"
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
