cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.65"
  sha256 arm:   "13eeecb774872449e1efe0892ea8ef0a1183c32c582c3d5178b58fc9b3241c91",
         intel: "1a0222ae48309314dd5da28b41741c464ae05003a3ea4f2a0d059e546b0ff682"

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
