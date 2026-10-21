cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.50"
  sha256 arm:   "6c806e4190e1e03e59a2f0c73683a76e154a0faf64b3c613f822d5cdfc93a648",
         intel: "1e20a786aba2a0c01225a973760bbdf6ea47c74c53296348e4742b7b1f5f163b"

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
