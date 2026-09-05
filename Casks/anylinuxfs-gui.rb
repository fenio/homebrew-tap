cask "anylinuxfs-gui" do
  version "0.7.5"
  sha256 "701118b5d04368a5153fa0f39d4fb78206509f409d6088797802efbab462fa3f"

  url "https://github.com/fenio/anylinuxfs-gui/releases/download/v#{version}/anylinuxfs-gui_#{version}_aarch64.dmg"
  name "anylinuxfs GUI"
  desc "GUI for mounting Linux filesystems"
  homepage "https://github.com/fenio/anylinuxfs-gui"

  depends_on :macos
  depends_on arch: :arm64

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
