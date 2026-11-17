cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.111"
  sha256 arm:   "9221aa8fc0038b4604b2dcefe3184cf5b2f14f30ad853d4b4861ce7ae1af6b90",
         intel: "16fb0117462541372571166389bdd7cbc1b3c69c0d50582617ce277a581a22af"

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
