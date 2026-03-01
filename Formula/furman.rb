class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.1"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "239adfc85139706bfc3837bfd8f0b49f81807ece3f6fc447b3c21d4f97db44ba"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
