class Furman < Formula
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"
  version "0.2.2"
  license "GPL-3.0-only"

  depends_on :linux

  url "https://github.com/fenio/furman/releases/download/v#{version}/furman-linux-amd64"
  sha256 "ee41749b9620ceda911711f997915e3da9df56e828bc4c3f515783d6f015997a"

  def install
    bin.install "furman-linux-amd64" => "furman"
  end
end
