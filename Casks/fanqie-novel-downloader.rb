cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.28-807-r767"
  sha256 arm:   "955e119372cb3750184bcf26e7a4278e583b0940b20a893ffe94edc67cc56591",
         intel: "3dd20385fa941286aec7dd9411ae349f7722813a63b70847c9c709689fdf8232"

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
