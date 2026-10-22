cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.51"
  sha256 arm:   "dc108d4b0868cef6a79047195f6a23b674b68605a43a1356afd9de4e54528257",
         intel: "e0c6b505aae775bd33a17217377a3c879a47337061f75d97a9ada3098ad9ec96"

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
