# Homebrew Tap

Homebrew packages distributed by `krustd`.

```bash
brew install --cask krustd/tap/wezterm
```

The repository can also host additional casks under `Casks/` and formulae under `Formula/`.

## Fanqie Novel Downloader

Install the upstream macOS release through this tap:

```bash
brew install --cask krustd/tap/fanqie-novel-downloader
```

The upstream app is not Developer ID signed or notarized. On first launch, allow it in **System Settings → Privacy & Security**. Use the Apple Silicon or Intel build automatically selected by the cask.

To maintain the cask after a new unsigned release:

```bash
python3 scripts/update-fanqie-cask.py
brew audit --cask krustd/tap/fanqie-novel-downloader
git diff -- Casks/fanqie-novel-downloader.rb
git add Casks/fanqie-novel-downloader.rb
git commit -m "Update Fanqie Novel Downloader cask"
git push
```

After the tap update is published, run `brew update && brew upgrade --cask krustd/tap/fanqie-novel-downloader` on each Mac. The updater only accepts a latest `unsigned-v*` release with both macOS DMGs and SHA-256 entries. It does not build or sign the app.
