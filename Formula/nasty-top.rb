class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.2"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.2/nasty-top-aarch64-linux.tar.gz"
      sha256 "c2dcd4b318384b49c155a3e172627b0efcebd1c567844c0eb40967f058f08611"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.2/nasty-top-x86_64-linux.tar.gz"
      sha256 "9a38e7a17cfc16764b3d2cc337b41fabadc606063b460767d5184ca9331260e7"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
