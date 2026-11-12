cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.99"
  sha256 arm:   "c99ea24422e68fdb774b8ccae999acf83b1f3fbfca150be509eec88c4fd8e9bf",
         intel: "2d6652185f603d925f8f62e4a0affabd6722b8bf79179cb0fa975a33b644dbee"

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
