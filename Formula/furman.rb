class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.3"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "272462edfa4507e64c0c0393fdc9267e4852cfa79d9cf32f4541659986e596fc"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
