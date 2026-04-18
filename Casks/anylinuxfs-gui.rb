cask "anylinuxfs-gui" do
  version "0.7.1"
  sha256 "e89f6ae88f10deec171333a8fc70a66c6a60e14ddbd5aac7757656b7a1998e71"

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
