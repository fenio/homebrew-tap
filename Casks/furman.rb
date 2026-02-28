cask "furman" do
  version "0.1.8"

  on_arm do
    sha256 "300f1fbfd3dd0a4ed4ad6134c38fd7aaabffb8ec6d246db2304d8cf065aecf86"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d196461544396161dd545b577ee273ffe45be418f69f88ee0bfeae9af0f8b41b"
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
