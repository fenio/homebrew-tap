cask "furman" do
  version "0.2.0"

  on_arm do
    sha256 "185dd8b849a7f56717b8f084e7a26d2d55dbe03fdf9aeb98c6ceffd8c0a4a168"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c328c9af0eb6d3198e7c99c562b90c9ecf432d9435d26acd20547d34089e303a"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-pane file manager for macOS"
  homepage "https://github.com/fenio/furman"

  app "Furman.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/Furman.app"]
  end

  zap trash: [
    "~/Library/Caches/com.furman.app",
    "~/Library/Preferences/com.furman.app.plist",
  ]
end
