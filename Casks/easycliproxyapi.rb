cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.90"
  sha256 arm:   "38ee245e9eda92a2097f13adb72db001a04bfc5eac2d1afd9ecd460519ed26a5",
         intel: "1bebbdc7d2cd0cfabb20b1c6b9d4938cbbbd377f44c6d6bb11cc388fef2447b1"

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
