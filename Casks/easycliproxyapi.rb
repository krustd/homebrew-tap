cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.74"
  sha256 arm:   "8782c0009ab8442b47e55f4c24517dacd4880cedf1cea0721c0ab944dc673b05",
         intel: "276de46d1e464608eb24a566744a377b20d29203360151694b9b64843a7b4398"

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
