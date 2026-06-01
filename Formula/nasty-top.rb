class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.7"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.7/nasty-top-aarch64-linux.tar.gz"
      sha256 "cc618d27066bc304e232a5e2ce4ef97de6faed7f79541dca7ef9c07d65067e72"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.7/nasty-top-x86_64-linux.tar.gz"
      sha256 "b1e7ffde291bcdeafc7e6cdd7ed003db07358f5984559e23c8f9b39fae478547"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
