cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.116"
  sha256 arm:   "fc8bc088631923adf1c9f4ceffd237270bfd6d4c811234b2b43a9ac37a4457fa",
         intel: "ba8eeb4704ae254816548684d2ab4f9f2ef2abb51852380c1c066d36f2636324"

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
