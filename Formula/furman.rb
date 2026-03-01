class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.4"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "0aa3686ee797b0baab815f709de595fa33039fa3ed232479d36ec8881c623d2f"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
