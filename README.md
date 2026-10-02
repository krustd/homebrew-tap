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

The [Update Fanqie workflow](https://github.com/krustd/homebrew-tap/actions/workflows/update-fanqie.yml) checks every six hours and can also be run manually. It selects the newest stable `unsigned-v*` release, requires both macOS DMGs and their SHA-256 entries, verifies new downloads, and commits the cask update automatically. Unchanged versions produce no commit. GitHub may delay scheduled runs.

After the automatic tap update, upgrade on each Mac:

```bash
brew update
brew upgrade --cask krustd/tap/fanqie-novel-downloader
```

The workflow reads releases directly from upstream GitHub and uses the built-in workflow token to update this tap. No fork, Gitea repository, or additional secret is required.

To update the cask manually from a clone of this repository:

```bash
python3 scripts/update-fanqie-cask.py
brew audit --cask krustd/tap/fanqie-novel-downloader
git diff -- Casks/fanqie-novel-downloader.rb
git add Casks/fanqie-novel-downloader.rb
git commit -m "Update Fanqie Novel Downloader cask"
git push
```

The workflow maintains package metadata. Installation and upgrades on a Mac happen when Homebrew is run. The updater does not build or sign the app.
