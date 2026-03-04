class FurmanBin < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.3.2"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "b0963f026004e57b40a6c46cd156e01a1e6a36394eab9db1f9b0fd271005bba3"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
