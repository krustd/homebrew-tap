cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.92"
  sha256 arm:   "e20273af3779fdf7a9e78f8f6be132860caa3df02f4e827c4e7a2bf64fdacff7",
         intel: "e6a174aefb73e0e8787985aeda3c6eab9c242a642d534917a8874a9725f1dd18"

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
