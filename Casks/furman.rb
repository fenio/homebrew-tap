cask "furman" do
  version "0.1.3"

  on_arm do
    sha256 "21681c9083f710635ea8fce4c57c2a318cbf375c8714f8a499457fffefc987f9"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "9483b45cebb1468a5a3ea99119005377afe8417e319521b3310ae8ee17031a85"
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
