cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.55"
  sha256 arm:   "ae9009573914e0967b56f53dad60e77c6ce8bf7e03d445b6c8567b68ea7ac5fb",
         intel: "34bb5745a255323e39d8d423999006fc20e34d5a6fabd664d7ed237c876dd8c8"

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
