cask "furman" do
  version "0.2.7"

  on_arm do
    sha256 "0fa0fffbd25532357223c7b0f767914e499f95087abdc34f07832ab78936237f"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d864496a6680e94611de78439f8d0048cb47e0ae191315ed8fafb3546f29f683"
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
