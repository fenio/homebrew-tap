class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.3.4"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.4/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "74604572841aeb3a54637396a21c15b9d3e5f7dddf861c56638325f304e7616f"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.4/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "b47f7a335422a38f9e1328d23af4489e2042b5869449a1368f5aeea291981916"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.3.4/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8041209adbfc2ff130d5f4747fadd1356df2a048acd5f1d79924534ac635af79"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.3.4/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "324670dd56e211995400e78e0b3f015210781b01971fa410d34f9083dd067c1c"
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
