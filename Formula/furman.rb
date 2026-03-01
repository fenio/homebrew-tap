class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.5"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "bd1ce81c29ad25140b7badf7cc6a6b91216a527095e88aec4c0396825e8335b4"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
