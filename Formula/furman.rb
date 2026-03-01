class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.6"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "79f4bde2bc627ec624139739a39146de312fef4d556e1f4828b82de4d7f42418"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
