cask "furman" do
  version "0.1.0"

  on_arm do
    sha256 "8263096721c059fd450691ab881b7e52f976965a37c9cd7868a3640d0170ca5c"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "dda16c18887fba4ff6093c36f9a4cb17fd7ba9916fec2220ad0130f3ad5c0501"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-panel file manager for macOS"
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
