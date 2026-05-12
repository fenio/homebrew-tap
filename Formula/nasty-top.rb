class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.5"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.5/nasty-top-aarch64-linux.tar.gz"
      sha256 "44ef35ca32d862926b4abbdafbb81075f702cec26abdc6e8027e0201d8e91fca"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.5/nasty-top-x86_64-linux.tar.gz"
      sha256 "6777a765a10c29e451ef41a40db57622b2c411ba4ae851fb42f76c2d2aebd734"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
