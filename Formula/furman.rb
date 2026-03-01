class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.2"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "a78f14882c9aaf0cf724ae2165da5cc68d4339e78e1c272da67b62d5b5b9a1c5"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
