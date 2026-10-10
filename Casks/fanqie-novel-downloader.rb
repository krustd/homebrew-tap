cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.10-653-r734"
  sha256 arm:   "d350752c10a41c0e1d8dcdef71ed601eeb8f53417368f5b5a696c438a84d7037",
         intel: "8ead894b932bd2d2c213f01b4636b659a56c062edfa24cd7e9e70bd98ef508c7"

  url "https://github.com/POf-L/Fanqie-novel-Downloader/releases/download/unsigned-v#{version}/FanqieNovelDownloader-tauri-darwin-#{arch}.dmg"
  name "Fanqie Novel Downloader"
  desc "Read and download Fanqie novels"
  homepage "https://github.com/POf-L/Fanqie-novel-Downloader"

  app "Fanqie Novel Downloader.app"

  caveats <<~EOS
    This upstream macOS build is not Developer ID signed or notarized.
    On first launch, allow the app in System Settings > Privacy & Security.
  EOS
end
