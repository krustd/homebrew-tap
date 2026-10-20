cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.47"
  sha256 arm:   "92a233d0ca1a44d8999623f2fd32d462ff9d54f0e1d1df0b57786865bd21a371",
         intel: "34995613659623aa0effaa2c41cc54c20dd20491ad8f2ca30e3ab49f126c69d2"

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
