cask "furman" do
  version "0.3.19"

  on_arm do
    sha256 "4d06ca34aca83efa3e18f597de08f5839f1baaac7ee750631e42658ffc8bd8a9"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "32df1190e337e143d4e0109c1cf36d9c6a278cd8437f12261661e18b108f937a"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-pane file manager for macOS"
  homepage "https://github.com/fenio/furman"

  app "Furman.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Furman.app"]
  end

  zap trash: [
    "~/Library/Caches/com.furman.filemanager",
    "~/Library/Preferences/com.furman.filemanager.plist",
  ]
end
