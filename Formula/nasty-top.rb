class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.8"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.8/nasty-top-aarch64-linux.tar.gz"
      sha256 "b25f47e72d285f2961d0422d1aa260395b162f544bda5aed83a5d325cb977e8f"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.8/nasty-top-x86_64-linux.tar.gz"
      sha256 "d5791dd8bce9a5417988a36e1cb3038e0bf45f5a562f899abc480747c2e9c8c5"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
