cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.43"
  sha256 arm:   "33c0d0757d9a18b35596b2e876a5f5f5ecba658bcc63ed24823ae86f657aa146",
         intel: "63413bd160d7724ca82c24229471c9fc56cbed5e6f56be7a82bcde0e41e3b53e"

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
