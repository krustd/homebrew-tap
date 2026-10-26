cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.53"
  sha256 arm:   "021d52767fe6ab72a04f0779d9021e1de4a9446dcc6ca8402a3accd54fa18f04",
         intel: "cab648c561601c3582e99c695ca8ff2698c373fa253c2e6465e28e49abed4ca9"

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
