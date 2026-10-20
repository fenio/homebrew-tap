cask "radio-caster-app" do
  version "0.1.0"
  sha256 "10e30fcaa55cd6b88ffd4580ae2db00473113c96b0bebb11948c49df79b0dc40"

  url "https://github.com/fenio/radio-caster/releases/download/v#{version}/Radio-Caster-#{version}.zip"
  name "Radio Caster"
  desc "Launcher app for the Radio Caster menu bar app"
  homepage "https://github.com/fenio/radio-caster"

  depends_on formula: "fenio/tap/radio-caster"
  depends_on :macos

  app "Radio Caster.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Radio Caster.app"]
  end

  zap trash: "~/Library/Caches/radio-caster"
end
