cask "furman" do
  version "0.3.2"

  on_arm do
    sha256 "5a7bbf78fed09f299e5c93f03407f0852fa8a258029d01558766fcdc1d4ed89a"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3285c32440d0b749b65ebf2b4d42c850df938ab5e1d15a24296deefcd3cdff56"
    url "https://github.com/fenio/furman/releases/download/v#{version}/Furman_#{version}_x64.dmg"
  end

  name "Furman"
  desc "Dual-pane file manager for macOS and Linux"
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
