class Terrarium < Formula
  desc "Terminal dashboard for managing tofu-controller Terraform and Flux Kustomization resources in Kubernetes"
  homepage "https://github.com/fenio/terrarium"
  version "0.2.7"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.7/terrarium-aarch64-apple-darwin.tar.gz"
      sha256 "92f90972743a59734fc695a41f9dfb8693811f36cc847fa8cb61590c94e33aee"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.7/terrarium-x86_64-apple-darwin.tar.gz"
      sha256 "7acb47d8d8b5cdb800b96a1e2df476d528f8a605be039f94430e27c4a4d47eea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fenio/terrarium/releases/download/v0.2.7/terrarium-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4d08a7b6c5486356f719e8700cca7582da3c68c17a7e04e2b6b392f1341a13f"
    else
      url "https://github.com/fenio/terrarium/releases/download/v0.2.7/terrarium-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84bfeea102ad41faa20a6136900fb5acdfed466be3fd7ec75c9cdd3344ddddcf"
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
