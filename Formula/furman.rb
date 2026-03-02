class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.7"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "a8a6eb7b7e366ff871cd9088c4b06db9ea9c9bb3cdb7a898095e588b0d56896f"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
