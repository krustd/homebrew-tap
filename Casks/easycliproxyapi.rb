cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.80"
  sha256 arm:   "495795d924a654ba96588045021f3e42bae581f66ba32870c42a890807cf9d6b",
         intel: "8b86ddaf89786b05ce5e3cd97bc4b8733a113828f0d82837a9533a4728dac7ed"

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
