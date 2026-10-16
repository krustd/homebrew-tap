#!/usr/bin/env python3
"""Update the EasyCLIProxyAPI cask from its latest stable GitHub release."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
from urllib.request import Request, urlopen

REPO = "router-for-me/EasyCLIProxyAPI"
API = f"https://api.github.com/repos/{REPO}/releases/latest"
ROOT = Path(__file__).resolve().parents[1]
CASK = ROOT / "Casks/easycliproxyapi.rb"
ASSETS = {
    "aarch64": "EasyCLIProxyAPI-v{version}-Darwin-aarch64.dmg",
    "amd64": "EasyCLIProxyAPI-v{version}-Darwin-amd64.dmg",
}


def fetch(url: str) -> bytes:
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "homebrew-tap-maintenance",
    }
    token = os.environ.get("GITHUB_TOKEN")
    if token and url.startswith("https://api.github.com/"):
        headers["Authorization"] = f"Bearer {token}"
    with urlopen(Request(url, headers=headers), timeout=120) as response:
        return response.read()


def main() -> None:
    release = json.loads(fetch(API))
    tag = release["tag_name"]
    if release.get("draft") or release.get("prerelease") or not tag.startswith("v"):
        raise RuntimeError(f"latest release is not a stable version: {tag}")
    version = tag.removeprefix("v")
    assets = {asset["name"]: asset for asset in release["assets"]}
    checksums: dict[str, str] = {}
    for arch, template in ASSETS.items():
        name = template.format(version=version)
        asset = assets.get(name)
        if asset is None:
            raise RuntimeError(f"missing release asset: {name}")
        data = fetch(asset["browser_download_url"])
        digest = hashlib.sha256(data).hexdigest()
        expected = asset.get("digest", "").removeprefix("sha256:")
        if expected and digest != expected:
            raise RuntimeError(f"SHA-256 mismatch for {name}: {digest} != {expected}")
        checksums[arch] = digest

    source = CASK.read_text()
    import re

    source = re.sub(r'(version ")[^"]+("\n)', rf'\g<1>{version}\g<2>', source, count=1)
    source = re.sub(
        r'(sha256 arm:   ")[^"]+(",\n\s*intel: ")[^"]+("\n)',
        rf'\g<1>{checksums["aarch64"]}\g<2>{checksums["amd64"]}\g<3>',
        source,
        count=1,
    )
    CASK.write_text(source)
    print(f"Updated EasyCLIProxyAPI cask to {tag}")


if __name__ == "__main__":
    main()
