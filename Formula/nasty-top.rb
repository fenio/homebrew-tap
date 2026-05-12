class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.5"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.5/nasty-top-aarch64-linux.tar.gz"
      sha256 "eba1e31613e9a2d80476f71a7c3ca54119033587eb5232529ada2f58b9e16beb"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.5/nasty-top-x86_64-linux.tar.gz"
      sha256 "f32f9fea4db38a5fd19ee2a862dfcee3fd8bd97b090a55e068adaa91dc2c5319"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
