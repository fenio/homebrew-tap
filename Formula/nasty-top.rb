class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.4"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.4/nasty-top-aarch64-linux.tar.gz"
      sha256 "b214be9e432b583c2e334fc6e027e2d29c16a6f4e750d1882fe15ef05e23e8f7"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.4/nasty-top-x86_64-linux.tar.gz"
      sha256 "5db5b971be041bfeb26de90a7d4314707c148d688c52c28aa933d99bff5999d8"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
