cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.79"
  sha256 arm:   "f1e04765d6d0df02a01ce77902dc26750b0158269a15132fd35f38a805f22e72",
         intel: "082b4df61d775f868e1d59fb8f4350a3d321d6b1ba1c76c87238040196917762"

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
