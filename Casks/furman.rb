cask "furman" do
  version "0.2.2"

  on_arm do
    sha256 "918f6f2fd35a462bb31d051794a7cf8005d01f74aa9ceb08bdb9b168655e3e3e"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "45d8dbca2a54004db72ac4f96013fb7d95c0d2cabb2827a15fe0ea5ee44088c8"
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
