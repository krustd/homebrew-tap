cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.18-426-r844"
  sha256 arm:   "e48d3c60bb21545d7b45d353c3655a5c169206de8ed75cd3bf9c4df0e4f287df",
         intel: "a842003a224fd83df2bac07c9775f6a8161acb116953e3a21fadbf4ca3090515"

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
