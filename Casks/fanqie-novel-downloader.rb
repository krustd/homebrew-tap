cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.29-958-r771"
  sha256 arm:   "8dd9f0345ae58775ca90dafc43dffa248369475a092d80589f56fca4826901f9",
         intel: "2761198fd797edb03bf0a1e4467636b126dfc12397e188335d89640a297410c8"

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
