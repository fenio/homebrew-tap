cask "anylinuxfs-gui" do
  version "0.8.2"
  sha256 "3715bfe67d935f6f763ff37de6d9ebcd8f0c368aedceb1d7ef90b0e43e44ede5"

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
