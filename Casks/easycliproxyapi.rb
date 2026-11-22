cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.119"
  sha256 arm:   "c55fa4a1f4ba4cbc5e8a770e1e328d342c9c06ef154bea7e7f22f8f661037dfb",
         intel: "20a3bda702877f68ffd94dd279c01518e1e304f0a726adfcf807e4ffeb3533e7"

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
