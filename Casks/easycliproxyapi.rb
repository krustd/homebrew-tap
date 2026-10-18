cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.44"
  sha256 arm:   "bcf2d0b7491d5a820bf00a10122b85aff513bf00bac32a7110ae7cb606956695",
         intel: "575b32c1924606581ab422e4127241f762bf209f4bfbbebbea940099a8c4d56c"

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
