cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.60"
  sha256 arm:   "9caa8a89371b922398b34e0f89ec582053965022d7c38cae253c398d2b24ff1a",
         intel: "53468498d6631d710ece18d52e4a4695517e1972e8edad162513ae725df41aea"

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
