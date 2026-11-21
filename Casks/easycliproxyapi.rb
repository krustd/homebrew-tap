cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.118"
  sha256 arm:   "3ceb06512c0f93992d844b6b7c7435afa2533b151084268c6fa38f8010c69712",
         intel: "ad0e17427a3e37270150aceb59e14848088d68d2652a5115acb08e71cb92e282"

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
