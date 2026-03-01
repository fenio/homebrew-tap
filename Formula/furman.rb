class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.2"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "fedaba40f78b062e4211740de09038f7215fa60f13e5d828e9465eaa69e45672"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
