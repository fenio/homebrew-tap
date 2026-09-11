class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.11"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.11/nasty-top-aarch64-linux.tar.gz"
      sha256 "66254c6d05709c6e417e1d222a0a56cbe3905137cc3ece753e87f743493e412c"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.11/nasty-top-x86_64-linux.tar.gz"
      sha256 "068b957501806fb70970a9d64691cabbc32956ec43eb3a223ad63f1bbee4514c"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
