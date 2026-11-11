cask "anylinuxfs-gui" do
  version "0.8.3"
  sha256 "74f96ee058c14a720471209cd3a25eb1d56fca04eaca9835a8d1ac833d89576e"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "GUI for mounting Linux filesystems"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on arch: :arm64
  depends_on formula: "nohajc/anylinuxfs/anylinuxfs"
  depends_on :macos

  app "anylinuxfs-gui.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/anylinuxfs-gui.app"]
  end

  zap trash: [
    "~/Library/Caches/com.anylinuxfs.gui",
    "~/Library/Preferences/com.anylinuxfs.gui.plist",
  ]
end
