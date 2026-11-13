cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.101"
  sha256 arm:   "b289ff6966dc64ec8d38b8ff37df49c44a03089a631b942b2bcbb6dbebb16135",
         intel: "ab44b53543ea8b5c75f982dd37dde96c9575dbbb14c51cfb0231d5b98e7ebb61"

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
