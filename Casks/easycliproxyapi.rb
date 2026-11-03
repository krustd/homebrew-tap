cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.67"
  sha256 arm:   "89fd71342502425d7c9551f824da430b78f6197ab569b3c3dc696c072261a48d",
         intel: "ab86c313a98d1ce4577f3a0633e44a876555cd47b84b44bfee84c10bdda8d057"

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
