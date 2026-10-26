cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.52"
  sha256 arm:   "9ede4a6ed84af9771985696c8532a7fa663675010ece29412f0f3917fc65c096",
         intel: "f90c28fdb0083cae2e50b5230bd7fadf426920726eb378d8b70350e88d9cfddb"

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
