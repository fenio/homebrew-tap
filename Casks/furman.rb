cask "furman" do
  version "0.1.7"

  on_arm do
    sha256 "7648ba324c8b1fc1e1c0e44b7cfa8ab2b054efc72cbd57edc0597dbd50cbfc55"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "4285f66384ea40fcea824a4b2cc2d74d4d2198d565ae5b32b644fc1e88b2080b"
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
