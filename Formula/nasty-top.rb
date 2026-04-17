class NastyTop < Formula
  desc "Interactive bcachefs tuning workbench — live metrics + sysfs knobs"
  homepage "https://github.com/nasty-project/nasty-top"
  version "0.0.1"
  license "GPL-3.0-only"

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.1/nasty-top-aarch64-linux.tar.gz"
      sha256 "cc3ff9cae277d90f974434112081d8259042264f4ce7ecc4d299a98f2245892d"
    else
      url "https://github.com/nasty-project/nasty-top/releases/download/v0.0.1/nasty-top-x86_64-linux.tar.gz"
      sha256 "372963dbe38c983a461499c117401803eb4fb833dae88047e4ce21bca4d917db"
    end
  end

  def install
    bin.install "nasty-top"
  end

  test do
    assert_match "nasty-top", shell_output("#{bin}/nasty-top --help")
  end
end
