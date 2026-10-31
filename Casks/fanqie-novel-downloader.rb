cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.10.31-858-r776"
  sha256 arm:   "73126e99a3dc052b06597a5a431f0e689ace69777adb2a475d1d752a127c6f4f",
         intel: "96345e5ea2b233b43a21ffbdcc4ed51104c26e94f7ef13b41b9165cba6f65479"

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
