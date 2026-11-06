cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.77"
  sha256 arm:   "2bf7df6da203c1609fde5463cdd34d8e437a15aa6ff4d966b149c1508671a52e",
         intel: "b7f8a03189b75db9bddc71a1dcfb3438a90b8c506b1c3da94ff3134a755dbe9b"

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
