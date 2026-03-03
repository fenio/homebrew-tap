class FurmanBin < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.3.1"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "ad4680ded73a32232b5bfbe7a51445ad4ecac1b1df6b45dd1d30eed166f7b190"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
