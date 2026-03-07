cask "furman" do
  version "0.3.4"

  on_arm do
    sha256 "5ba64bdda2b9f2fe3980575fd20e2e38e615ea236d2c877a643eb73150bdeeb1"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "233e2d5a40aba17158c0217f94cc10cbf4f6f559b5bdbfe889e404349e3dfb50"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-pane file manager for macOS"
  homepage "https://github.com/fenio/furman"

  app "Furman.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/Furman.app"]
  end

  zap trash: [
    "~/Library/Caches/com.furman.filemanager",
    "~/Library/Preferences/com.furman.filemanager.plist",
  ]
end
