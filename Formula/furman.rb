class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.0"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/furman_#{version}_amd64.AppImage"
  sha256 ""

  def install
    bin.install "furman_#{version}_amd64.AppImage" => "furman"
  end
end
