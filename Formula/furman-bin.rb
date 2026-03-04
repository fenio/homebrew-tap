class FurmanBin < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.3.2"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_amd64.AppImage"
  sha256 "7a61ad2d9124b945e3220e4d5b27e5ce47b237e82d680837107bb75227091f1c"

  def install
    bin.install "Furman_#{version}_amd64.AppImage" => "furman"
  end
end
