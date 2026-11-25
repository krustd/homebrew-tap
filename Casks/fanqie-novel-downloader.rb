cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.25-1256-r880"
  sha256 arm:   "0180257643500b51ab7f02efe102adabe51a9062f0dc9c0c6c9e65ce4152b634",
         intel: "9fd088cc5c15ef8ad46d29a4d79e49e0cb38e311409fb98c27f802f731d16128"

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
