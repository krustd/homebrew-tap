cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.97"
  sha256 arm:   "90fb91503a88a97a3fab2712727196329dd5f78776884a659f918dac8fbf1272",
         intel: "a9816d026ec679ad4df233475968f245645370025319cccffd8d4e08bd64cebb"

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
