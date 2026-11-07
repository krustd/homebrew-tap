cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.89"
  sha256 arm:   "e34eedfcab39453c3c9c3d8f44efb44455178b72a2b390323025406cc910df62",
         intel: "35225baaeb41a3ce03cf047a6c10c52bcbc30c6b489bec862d3f571da8e0f1ab"

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
