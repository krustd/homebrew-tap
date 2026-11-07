cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.83"
  sha256 arm:   "585945ce8787cb481b718186ced581e1d223da85095c39862c068d926bed428a",
         intel: "94483524ba7de7fb0313400f69ecbe30fbf0b930abe3315b380cf4e1c4c00039"

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
