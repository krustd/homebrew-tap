cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.69"
  sha256 arm:   "de444ee1195462a8be54d6e01a9e1f2dbd0159e8e4de9cea25b8377805faf2fe",
         intel: "bdc52383e554253a05c02c68b6f4ab4058e3e54c70d6b34e27aaf9085ed1bd41"

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
