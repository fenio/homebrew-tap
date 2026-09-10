class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.10"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.10/nasty-top-aarch64-linux.tar.gz"
      sha256 "bec3c4e8a2595a050068af3006df15f4cdb68612c52161d51aba395bcfc47cc9"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.10/nasty-top-x86_64-linux.tar.gz"
      sha256 "d8bca92580126c8de513129dd45ded2ab5608b00d518e245b4f6e169d4d5a65d"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
