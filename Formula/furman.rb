class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.3"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "e19417657ab4f8615fa485e27e549bf4f5b70bd7d3a047030a3fd2d301267b6d"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
