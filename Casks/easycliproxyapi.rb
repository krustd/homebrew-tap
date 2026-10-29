cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.59"
  sha256 arm:   "b8de0c2b983b8637b7e60d63d28abca1f84315c1c37da460ba1b384af625590f",
         intel: "8e4e215dfc84e31ad6d01e4c901d4b9696146444b4ae6095694458fff345f686"

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
