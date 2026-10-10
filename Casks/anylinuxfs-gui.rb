cask "anylinuxfs-gui" do
  version "0.8.1"
  sha256 "3c2269d1408f21fd6ce959b5b3c83870b1567388cfb7bd8c1c62452fa93c6724"

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
