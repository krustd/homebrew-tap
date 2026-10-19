cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.46"
  sha256 arm:   "5cf337c2945a0276682ba367b49bf2ac0fa814376f424b860c656801dfcc7922",
         intel: "a028a3fb2da98dca59fd4284acf09bc8b497b786e55fff6e20793abf9f78d481"

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
