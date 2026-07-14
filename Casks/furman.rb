cask "furman" do
  version "0.3.12"

  on_arm do
    sha256 "bb6cdca4e1fb252fccb6f81fa4f2ff80ac8c67f36ef421d94dfd3849c9c00559"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "6f99950ce08f46ecbd01bd08b56b247a824a60ce42d31c5875664e28b345b12d"
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
