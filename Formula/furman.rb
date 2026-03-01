class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.3"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "346f502f7059b33802f0f1d2946c02ce0f1b338bbfd82f9e6a08065484864b63"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
