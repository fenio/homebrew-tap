cask "anylinuxfs-gui" do
  version "0.7.0"
  sha256 "bf0cd8406dfcae854f760a7eadec096324e450e429e85c970229b0ffd1721c68"

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
