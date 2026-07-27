cask "furman" do
  version "0.3.14"

  on_arm do
    sha256 "e8db12442a168f8fabd4137c5c5a5977fbba168c089ea4c04c9d727ed9e87ac4"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d6c971fd8034c70c9ae5a9df40456424e1944316bdf0a823244d3534ec353510"
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
