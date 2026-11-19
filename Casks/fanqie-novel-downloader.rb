cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.19-523-r853"
  sha256 arm:   "cdefff4c25dd98cfba3aa4a2616b56da5480b30ff3772447af2c9bec04e376af",
         intel: "2be271306164c11c935479a40b87eb415d8b1b49a233ef8ab57e78c47729f1c3"

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
