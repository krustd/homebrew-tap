cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.121"
  sha256 arm:   "536d70a3bc3748e407cddf864e6cd1d0ba6af5a7105ee9ae09fb8657aa11f5c4",
         intel: "2559652d653776260138bb1a074496cbd0c291e3ea91ed03e28836a5c5160b4a"

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
