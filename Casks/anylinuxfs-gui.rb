cask "anylinuxfs-gui" do
  version "0.6.5"
  sha256 "4d324baa5f71026689bcfb80e76953835763119009cfb44b729cf3e39d8d17a6"

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
