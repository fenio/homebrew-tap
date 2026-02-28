class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.0"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "21e6b39e653634f86dd1ddafb9503d2531777f0d990b70bfe612bd643b8f1ceb"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
