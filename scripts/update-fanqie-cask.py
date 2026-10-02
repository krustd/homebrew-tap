#!/usr/bin/env python3
"""Update the Fanqie cask from the latest unsigned upstream release."""

import json
import re
from pathlib import Path
from urllib.request import Request, urlopen


REPO = "POf-L/Fanqie-novel-Downloader"
CASK = Path(__file__).resolve().parents[1] / "Casks/fanqie-novel-downloader.rb"
API = f"https://api.github.com/repos/{REPO}/releases/latest"
FILENAMES = {
    "arm": "FanqieNovelDownloader-tauri-darwin-aarch64.dmg",
    "intel": "FanqieNovelDownloader-tauri-darwin-x64.dmg",
}


def fetch(url):
    request = Request(url, headers={"User-Agent": "homebrew-tap-maintenance"})
    with urlopen(request, timeout=30) as response:
        return response.read()


def replace_once(source, pattern, replacement):
    updated, count = re.subn(pattern, replacement, source, count=1, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"Expected one match for {pattern!r}")
    return updated


def main():
    release = json.loads(fetch(API))
    tag = release["tag_name"]
    if not re.fullmatch(r"unsigned-v\d{4}\.\d{1,2}\.\d{1,2}-\d+-r\d+", tag):
        raise ValueError(f"Latest release is not an unsigned build: {tag}")

    assets = {asset["name"]: asset["browser_download_url"] for asset in release["assets"]}
    for filename in (*FILENAMES.values(), "SHA256SUMS-unsigned.txt"):
        if filename not in assets:
            raise ValueError(f"Release {tag} is missing {filename}")

    manifest = fetch(assets["SHA256SUMS-unsigned.txt"]).decode("utf-8")
    checksums = {}
    for line in manifest.splitlines():
        match = re.fullmatch(r"([0-9a-fA-F]{64})\s+\*?(.+)", line)
        if match:
            checksums[match.group(2)] = match.group(1).lower()
    for filename in FILENAMES.values():
        if filename not in checksums:
            raise ValueError(f"Checksum manifest is missing {filename}")

    source = CASK.read_text()
    updated = replace_once(source, r'^  version "[^"]+"$', f'  version "{tag.removeprefix("unsigned-v")}"')
    updated = replace_once(
        updated,
        r'^  sha256 arm:   "[0-9a-f]{64}",\n         intel: "[0-9a-f]{64}"$',
        f'  sha256 arm:   "{checksums[FILENAMES["arm"]]}",\n'
        f'         intel: "{checksums[FILENAMES["intel"]]}"',
    )
    if updated != source:
        CASK.write_text(updated)
        print(f"Updated {CASK.name} to {tag}")
    else:
        print(f"Already current: {tag}")


if __name__ == "__main__":
    main()
