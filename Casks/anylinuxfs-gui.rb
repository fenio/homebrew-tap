cask "anylinuxfs-gui" do
  version "0.1.8"
  sha256 "213ec46f00c19184e711789af6a3252e30c7c454781b7497c38e44356925bfe9"

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
