cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.42"
  sha256 arm:   "e36025ee1ff3fc3ccd3fbf5508e63adc093e8fc656effc1206d9b00a43d1f8d3",
         intel: "725e3b2c91c9d0beac3411cc546986d4e62c48552bb9cab88f7190c92d929ee1"

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
