cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.98"
  sha256 arm:   "6e6972ed59de8e600ac4186a2f9fe66f526c06012468ea1e0b226bb744dd6307",
         intel: "e11852b77cf62920c51c829875b791d8b42b0118d09dd3197426145f84f23fc2"

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
