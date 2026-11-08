cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.91"
  sha256 arm:   "9e019ef5d8a5ebcd7e2245f59b7efab0b9a0b039a42c7252b650bacc8ddefe50",
         intel: "cc53590952701a1751f7142a50f89ab1a26d25f3d73723aafcc313be0f40cc76"

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
