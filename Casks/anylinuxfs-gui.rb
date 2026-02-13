cask "anylinuxfs-gui" do
  version "0.4.6"
  sha256 "f1d08dd3b2cf2671cef1ba3a071a0ae05362a57fc3e5254d30c9bfcee7a25a24"

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
