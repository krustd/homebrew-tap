cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.113"
  sha256 arm:   "a57b34fccd61c7301ec21568e30142b2ae1737f3b3591ebfe6788a5718ad5bf2",
         intel: "5670aa8c602e88432f9a782d71d8ad39ac28ea561912137c17f523e70ec27346"

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
