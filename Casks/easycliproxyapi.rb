cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.54"
  sha256 arm:   "2a83d24866c993239158436a0398309239b71f812d1cad5fc3394e42e8750de3",
         intel: "1892da646d0e460ccfb3d7a901c616907de87fffbf350e3d80d75be4f403a0c0"

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
