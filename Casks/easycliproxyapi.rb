cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.70"
  sha256 arm:   "40346c3c0f620b58d1ad802ac8d322c5efc6146bdbfbea48585f5ddbecb84819",
         intel: "be5ff03f335dfcdc98af0ad1b6343b3e2adc13dfc34101fb2ec1417e771ec435"

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
