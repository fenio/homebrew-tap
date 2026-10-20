cask "greebar" do
  version "0.1.0"
  sha256 "89b226819f1cb78e6ff697dae3a640fdccd6c7a90104e5477ba869300180a495"

  url "https://github.com/fenio/greebar/releases/download/v#{version}/GreeBar-#{version}.zip"
  name "GreeBar"
  desc "Menu bar controller for Gree air conditioners"
  homepage "https://github.com/fenio/greebar"

  depends_on macos: ">= :sonoma"

  app "GreeBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/GreeBar.app"]
  end

  uninstall quit: "local.greebar.GreeBar"

  zap trash: "~/Library/Preferences/local.greebar.GreeBar.plist"
end
