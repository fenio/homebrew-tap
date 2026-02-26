cask "furman" do
  version "0.1.6"

  on_arm do
    sha256 "3bd280ea12e18ba7c1981331c356164e1ce18d9114a9e4ddbdbfa25aa4317b64"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c0c07ff23431c8ecea47e6be20e748b99e29d1bf8b278af4bc44c705fd997a38"
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
