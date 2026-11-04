cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.71"
  sha256 arm:   "4b73cb66a302a864461f600e9b77403ea722324abb34f21c0bca432433f3ece1",
         intel: "b94fe7241b9ce947f99a5b27592e092d87d240f7d6d0b659f5d7d2da4b22beab"

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
