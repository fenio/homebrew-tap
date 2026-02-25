cask "furman" do
  version "0.1.5"

  on_arm do
    sha256 "1866e0d52fec75e25bcc826186e78a6945298c87ad2addc4cb261cb848ca7c04"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "2ec9d60ca0da3da1f50a7219a6ef74cec2880047a56c4e2267430dcae4acb3ed"
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
