class FurmanBin < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.3.3"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "0d0c1bc8fe20cd33588965619cbf4ba5761a246b1a4208f53a763cf12e781038"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
