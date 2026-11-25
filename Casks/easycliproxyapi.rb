cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.120"
  sha256 arm:   "39dcf5d3d7059edde4a17013d5f65e6c86b96e35e0ca9942333ddf5555061e68",
         intel: "b523c7d6e7e2b8386956a60a505387167e3de6802bfa628e3a4ab18027c56c29"

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
