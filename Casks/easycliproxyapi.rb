cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.107"
  sha256 arm:   "e0896f0d5e2e22c3372382d2c4b56cb60f230f63d24369a83a85918d2689014f",
         intel: "2e46daf8b0146a9844498471d03c142186c442b43ae4f3c95a0cc33b6623a0c2"

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
