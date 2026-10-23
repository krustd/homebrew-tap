cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.23-557-r750"
  sha256 arm:   "1a81e1c6d6db8b593d3322b2bcb6aacaafc3fba61ab14e8d8f6d672c5bfd9409",
         intel: "f61378e8d5e1d8943a2f94a9b4b75cae58fe907911c3acfcce2a46f9f127826a"

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
