class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.9"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.9/nasty-top-aarch64-linux.tar.gz"
      sha256 "2240947de85947aacd04c7fa5f7eb1beab5b769868cd20b1b80532cbf2dee369"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.9/nasty-top-x86_64-linux.tar.gz"
      sha256 "71a00ddf74060147fc3edca86b05531e4e615aa764724b971e3dc8ea6eb8ab1f"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
