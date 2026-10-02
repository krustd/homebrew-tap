cask "fanqie-novel-downloader" do
  arch arm: "aarch64", intel: "x64"

  version "2026.9.30-1510-r718"
  sha256 arm:   "996cec6ece4a192ad7561b2166380286472130d223047795b086530514e1abb6",
         intel: "122fafe675730189708cf1da44cb36e498af88e24b9e7e13c052e81bfb603f79"

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
