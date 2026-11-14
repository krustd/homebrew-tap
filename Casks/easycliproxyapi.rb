cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.104"
  sha256 arm:   "131e00dc36bd54b3226c61119950a22b117fce68eb6df26c4aac6557ad39f3bf",
         intel: "dcef42fca50ace2802bf2061f0057a801905e6cafd9bebe57a6df560f85341ed"

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
