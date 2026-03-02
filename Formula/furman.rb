class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.3.0"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "7184618bfc7ceed028a5378a6c6c3e4ce4a9a78d9344b72bab580552cb7991e1"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
