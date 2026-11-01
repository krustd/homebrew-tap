cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.62"
  sha256 arm:   "ada4e238f0b3efb2c8bbb1695aef02782de4a56bac55a827f0e0e56f296073aa",
         intel: "6c44b344f0995b3f85865bd071cf86159e0528acbedf405923d26fcd9b10d00c"

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
