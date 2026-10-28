cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.56"
  sha256 arm:   "ba108e878287f3864e82228f1efa18c8507d8f8baa14f80ad51deec2a35ffcc5",
         intel: "8ca1246a114ac99936ae41db0980e3c51d61e2afb96ff48e52118619d02cc362"

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
