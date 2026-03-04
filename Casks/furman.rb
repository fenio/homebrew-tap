cask "furman" do
  version "0.3.2"

  on_arm do
    sha256 "fb99af78263129d0b676c6a001f8723cf09092fe866b56ee5b16d1e8527ad7d5"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d618759cfb6f0371254b6b4a9424cd64297e09535f5d308787c72bcab76086e5"
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
