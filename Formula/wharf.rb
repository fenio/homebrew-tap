class Wharf < Formula
  desc "Zero-touch Windows 11 ARM VMs on Apple silicon via QEMU+HVF (SSH/CI-ready)"
  homepage "https://github.com/fenio/wharf"
  url "https://github.com/fenio/wharf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5c9c10cf4a6466ada960024f9d14d0027806aaaea72af7c906a4d194dafe07f9"
  license "MIT"

  depends_on arch: :arm64
  depends_on "cdrtools"
  depends_on :macos
  depends_on "qemu"
  depends_on "wimlib"

  def install
    libexec.install "wharf", "lib", "assets"
    bin.install_symlink libexec/"wharf"
  end

  def caveats
    <<~EOS
      wharf runs Windows 11 ARM via QEMU + HVF on Apple silicon.

      Optional extras:
        brew install aria2    # faster ISO downloads
        brew install swtpm    # only if you set USE_TPM=Y

      Get started:
        wharf doctor
        wharf new win11
    EOS
  end

  test do
    assert_match "Windows 11 ARM", shell_output("#{bin}/wharf help")
  end
end
