cask "anylinuxfs-gui" do
  version "0.1.0"
  sha256 "3eed8466952ff568fafe1c751eb541d2bd8f572dc19b448f81de25974db3d703"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "macOS GUI for anylinuxfs - mount Linux filesystems on macOS"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on formula: "anylinuxfs"
  depends_on arch: :arm64

  app "anylinuxfs-gui.app"

  zap trash: [
    "~/Library/Caches/com.anylinuxfs.gui",
    "~/Library/Preferences/com.anylinuxfs.gui.plist",
  ]
end
