cask "greebar" do
  version "0.1.1"
  sha256 "f7e0d7fd455f55b36ff8d64bc495529af686622c7a090f8f93b3acb71c0f926a"

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
