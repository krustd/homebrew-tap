cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.58"
  sha256 arm:   "bcdcb373cb6639a9a23125f02d09e59d0fede55fba9a960cb36d4ba971bcf6e9",
         intel: "0b380ea8b8fff4e9cca950096bde2aafacefd88b8e88c28b754c499f48d2a92e"

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
