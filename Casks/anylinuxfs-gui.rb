cask "anylinuxfs-gui" do
  version "0.7.2"
  sha256 "7b920d997b12736a6d93c14ecb60c6fec68c3470a3a6f40dbecc120bec906a8b"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "macOS GUI for anylinuxfs - mount Linux filesystems on macOS"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on arch: :arm64

  preflight do
    system_command "/opt/homebrew/bin/brew",
         args: ["tap", "nohajc/anylinuxfs"]
    system_command "/opt/homebrew/bin/brew",
         args: ["install", "nohajc/anylinuxfs/anylinuxfs"]
  end

  app "anylinuxfs-gui.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/anylinuxfs-gui.app"]
  end

  zap trash: [
    "~/Library/Caches/com.anylinuxfs.gui",
    "~/Library/Preferences/com.anylinuxfs.gui.plist",
  ]
end
