cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.41"
  sha256 arm:   "11bfcdd3c0f788b9f8710675e88cadb847bccbb6eec4c2b874ffd2a1aaf3eb3e",
         intel: "99dd19ed5d3dd9b06fb2cc141692b263fdfab9687c2cced1f4ebf2775b9f5781"

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
