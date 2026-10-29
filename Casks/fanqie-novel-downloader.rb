cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.29-1422-r774"
  sha256 arm:   "278bd8c84f06b581ec735a32b2faefa3b825d10907afd1fa0e0ca6ff00487227",
         intel: "af70dff2edc82817b1cd00e80f08ba42d35e9b9e0fa42620f56952d52effa391"

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
