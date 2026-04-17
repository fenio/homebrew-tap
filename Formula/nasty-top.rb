class NastyTop < Formula
  desc "A top-like TUI for bcachefs filesystems"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.3"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.3/nasty-top-aarch64-linux.tar.gz"
      sha256 "f46d72fac8d02489e62b88afc557c661610d32d47cab4ea27d41877c34c37b18"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.3/nasty-top-x86_64-linux.tar.gz"
      sha256 "78deaeccbb6e055ab14745ada1c369ca46f0d154200e89e65ca78844b1c5ba71"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
