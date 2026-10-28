cask "greebar" do
  version "0.1.2"
  sha256 "00825063c727d261558f4ebd1a9cd284dde850ab66955e8cec429d0bb68d1b97"

  url "https://github.com/fenio/greebar/releases/download/v#{version}/GreeBar-#{version}.zip"
  name "GreeBar"
  desc "Menu bar controller for Gree air conditioners"
  homepage "https://github.com/fenio/greebar"

  depends_on macos: :sonoma

  app "GreeBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/GreeBar.app"]
  end

  uninstall quit: "local.greebar.GreeBar"

  zap trash: "~/Library/Preferences/local.greebar.GreeBar.plist"
end
