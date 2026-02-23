cask "anylinuxfs-gui" do
  version "0.6.2"
  sha256 "6a2da06cd01642b8eb101a80220bcafb5c6ad1452a72332fc1ac64b6f0392dd3"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "macOS GUI for anylinuxfs - mount Linux filesystems on macOS"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on arch: :arm64

  app "anylinuxfs-gui.app"
  preflight do
    system_command "brew",
        args: ["tap", "nohajc/anylinuxfs"]
    system_command "brew"
        args: ["install", "nohajc/anylinuxfs/anylinuxfs"]
  end
  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/anylinuxfs-gui.app"]
  end

  zap trash: [
    "~/Library/Caches/com.anylinuxfs.gui",
    "~/Library/Preferences/com.anylinuxfs.gui.plist",
  ]
end
