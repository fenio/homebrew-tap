cask "anylinuxfs-gui" do
  version "0.8.0"
  sha256 "360d484e96750814391d624914950e7563365eec955071d6aaff1b7a4da10bdf"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "GUI for mounting Linux filesystems"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on arch: :arm64
  depends_on :macos

  app "anylinuxfs-gui.app"

  preflight_steps do
    run "{{HOMEBREW_BREW_FILE}}",
        args:           ["tap", "nohajc/anylinuxfs"],
        network_access: true,
        writable_paths: ["{{HOMEBREW_PREFIX}}"]
    run "{{HOMEBREW_BREW_FILE}}",
        args:           ["install", "nohajc/anylinuxfs/anylinuxfs"],
        network_access: true,
        writable_paths: ["{{HOMEBREW_PREFIX}}"]
  end

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/anylinuxfs-gui.app"]
  end

  zap trash: [
    "~/Library/Caches/com.anylinuxfs.gui",
    "~/Library/Preferences/com.anylinuxfs.gui.plist",
  ]
end
