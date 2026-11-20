cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.117"
  sha256 arm:   "32bb168a4391fc7d6f9807c214465dae5915b3152fa065be12ed339c8ff6e952",
         intel: "10b0740e30152392dabbd2938c28462897347eecea269bca3fdedc4c4d314f65"

  url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-#{arch}.dmg"
  name "EasyCLIProxyAPI"
  desc "Desktop GUI for CLIProxyAPI and AI-agent configuration"
  homepage "https://github.com/router-for-me/EasyCLIProxyAPI"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "EasyCLIProxyAPI.app"
end
