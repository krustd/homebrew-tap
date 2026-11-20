cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.20-524-r860"
  sha256 arm:   "82f3ee66536f5199c8c65f5af6897080af65201f6382e75b9ed7867aaeb6ce7c",
         intel: "41fd786f6d2eaff82a0f4f4c3caccbbe993b6c49a8d765a50847b6411a38ef01"

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
