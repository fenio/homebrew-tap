cask "furman" do
  version "0.3.5"

  on_arm do
    sha256 "24f4d1dccbc8e4b70ff0c708a7ff06c6ccea445e0e4254a24b0d1e4d0dbec6f4"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "1783cf135e718319edc851bcb9e684b387f8e897a0fd40553673893bf783496e"
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
    "~/Library/Caches/com.furman.filemanager",
    "~/Library/Preferences/com.furman.filemanager.plist",
  ]
end
