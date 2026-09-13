cask "lx-music" do
  arch arm: "arm64", intel: "x64"

  version "2.12.4"
  sha256 arm:   "923b7d962fb20d95b0ef21ce08b3e12ebc0485fda095a0732fbb7fe6bd9c5bbe",
         intel: "f28236ead7ba275155290cd20ef7059e50318c02d0e088d9ed9ad6314aa313fd"

  url "https://github.com/lyswhut/lx-music-desktop/releases/download/v#{version}/lx-music-desktop-#{version}-#{arch}.dmg"
  name "LX Music Assistant Desktop Edition"
  name "洛雪音乐助手桌面版"
  desc "Music app base on Electron & Vue"
  homepage "https://github.com/lyswhut/lx-music-desktop/"

  # The upstream macOS builds are only ad-hoc signed, so homebrew/cask disabled
  # the official cask on 2026-09-01 (:fails_gatekeeper_check); this tap keeps it
  # installable and drops the quarantine flag the download carries.
  depends_on macos: :monterey

  app "lx-music-desktop.app"

  postflight_steps do
    if_path_exists "/Applications/lx-music-desktop.app" do
      run "/usr/bin/xattr",
          args:           ["-dr", "com.apple.quarantine", "/Applications/lx-music-desktop.app"],
          must_succeed:   false,
          writable_paths: ["/Applications"]
    end
  end

  zap trash: [
    "~/Library/Application Support/lx-music-desktop",
    "~/Library/Logs/lx-music-desktop",
  ]
end
