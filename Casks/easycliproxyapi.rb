cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.76"
  sha256 arm:   "751f0da56386b491162ce98f105075d8ab174f56a8f79563f0fc7b58a54b5122",
         intel: "49917db73d8815c045ee5eb6e02d831dcd040a5048deaf1cb79e52c7285dd5e6"

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
