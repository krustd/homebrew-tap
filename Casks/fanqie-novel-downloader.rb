cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.7-1124-r814"
  sha256 arm:   "1c14ccbaaf8f2b96c3b14dd5c952eb0a4246edcb9fb2a318ea887391c81d897a",
         intel: "e5d825ce9b7cf33089064f9f3c48130cc979e6ca677a2dbbe77a81608954d95c"

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
