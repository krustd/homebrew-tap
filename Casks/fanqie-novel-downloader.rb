cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.11.19-1653-r857"
  sha256 arm:   "5834ed21996367c0e9dc1ca2036cadc8b763b06524d2cc2ba2a6ed283284b710",
         intel: "48b7f2d1d6b74962bd2559be55c0aaf0e6a5d98f8ab9ee167c2e1ec74815a98b"

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
