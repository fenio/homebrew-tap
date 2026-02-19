cask "anylinuxfs-gui" do
  version "0.5.2"
  sha256 "381b6a4e1b0597e2550103cb8d95b7d68e4b9d31a0e871421a6911fab4aca4c0"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "macOS GUI for anylinuxfs - mount Linux filesystems on macOS"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on formula: "nohajc/anylinuxfs/anylinuxfs"
  depends_on arch: :arm64

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
