class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.6"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.6/nasty-top-aarch64-linux.tar.gz"
      sha256 "cc71a81a0d38c306d14f606236e08044a1bcdf34530005aac46faa1528e4a43e"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.6/nasty-top-x86_64-linux.tar.gz"
      sha256 "90d35f8e457f3db3e585ac2039d453e9e5100ba4cce8cbc450b561877a2f6697"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
