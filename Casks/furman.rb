cask "furman" do
  version "0.3.0"

  on_arm do
    sha256 "86a7877eeb41c75cd90fa7940b4b81e47d5c8e1826302a864694af4757688d4f"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c4dc8c855e97b53a30b25352c73865b07f2029974c6a838691f47e9da10abef5"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-pane file manager for macOS and Linux"
  homepage "https://github.com/fenio/furman"

  app "Furman.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/Furman.app"]
  end

  zap trash: [
    "~/Library/Caches/com.furman.filemanager",
    "~/Library/Preferences/com.furman.filemanager.plist",
  ]
end
