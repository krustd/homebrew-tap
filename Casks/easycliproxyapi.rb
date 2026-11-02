cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.66"
  sha256 arm:   "ff0576b55909a1730f39f010a659a25faa1dc367fb3328f8c3077814c61ce52b",
         intel: "5eae2868773a1030e17c04acdef1c4f15be3f2b439d45cf1c02d9f26cb7e8e3f"

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
