cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.106"
  sha256 arm:   "4c345f58dcf0c62f1830c2d683fd347117be930369be06b71ab99fe7f44235fd",
         intel: "ecb6f71b92aeb1a79d77f2de55b405fcca69778858f5009bd94fcbaba858d891"

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
