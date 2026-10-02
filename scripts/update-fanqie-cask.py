#!/usr/bin/env python3
"""Update the Fanqie cask from the latest unsigned upstream release."""

import hashlib
import json
import os
import re
from pathlib import Path
from urllib.parse import urlparse
from urllib.request import Request, urlopen


REPO = "POf-L/Fanqie-novel-Downloader"
CASK = Path(__file__).resolve().parents[1] / "Casks/fanqie-novel-downloader.rb"
API = f"https://api.github.com/repos/{REPO}/releases?per_page=100"
TAG_PATTERN = re.compile(r"unsigned-v(\d{4})\.(\d{1,2})\.(\d{1,2})-(\d{1,4})-r(\d+)")
FILENAMES = {
    "arm": "FanqieNovelDownloader-tauri-darwin-aarch64.dmg",
    "intel": "FanqieNovelDownloader-tauri-darwin-x64.dmg",
}


def request(url):
    headers = {"User-Agent": "homebrew-tap-maintenance"}
    if urlparse(url).netloc == "api.github.com" and os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = f'Bearer {os.environ["GITHUB_TOKEN"]}'
    return Request(url, headers=headers)


def fetch(url):
    with urlopen(request(url), timeout=60) as response:
        return response.read()


def replace_once(source, pattern, replacement):
    updated, count = re.subn(pattern, replacement, source, count=1, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"Expected one match for {pattern!r}")
    return updated


def version_key(version):
    match = TAG_PATTERN.fullmatch(f"unsigned-v{version}")
    if not match:
        raise ValueError(f"Unrecognized version: {version}")
    return tuple(int(value) for value in match.groups())


def select_release(releases):
    candidates = [
        release for release in releases
        if not release.get("draft") and not release.get("prerelease")
        and TAG_PATTERN.fullmatch(release["tag_name"])
    ]
    if not candidates:
        raise ValueError("No stable unsigned release was found")
    return max(candidates, key=lambda release: version_key(release["tag_name"].removeprefix("unsigned-v")))


def verify_download(url, expected):
    digest = hashlib.sha256()
    with urlopen(request(url), timeout=60) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)
    if digest.hexdigest() != expected:
        raise ValueError(f"Downloaded file does not match its SHA-256: {url}")


def main():
    release = select_release(json.loads(fetch(API)))
    tag = release["tag_name"]
    version = tag.removeprefix("unsigned-v")
    source = CASK.read_text()
    current = re.search(r'^  version "([^"]+)"$', source, re.MULTILINE)
    if not current:
        raise ValueError("The cask version is missing")
    if version_key(version) < version_key(current.group(1)):
        raise ValueError("Refusing to downgrade the cask")

    assets = {asset["name"]: asset["browser_download_url"] for asset in release["assets"]}
    for filename in (*FILENAMES.values(), "SHA256SUMS-unsigned.txt"):
        if filename not in assets:
            raise ValueError(f"Release {tag} is missing {filename}")
        expected_url = f"https://github.com/{REPO}/releases/download/{tag}/{filename}"
        if assets[filename] != expected_url:
            raise ValueError(f"Unexpected asset URL for {filename}")

    manifest = fetch(assets["SHA256SUMS-unsigned.txt"]).decode("utf-8")
    checksums = {}
    for line in manifest.splitlines():
        match = re.fullmatch(r"([0-9a-fA-F]{64})\s+\*?(.+)", line)
        if match:
            filename, digest = match.group(2), match.group(1).lower()
            if filename in checksums and checksums[filename] != digest:
                raise ValueError(f"Conflicting checksums for {filename}")
            checksums[filename] = digest
    for filename in FILENAMES.values():
        if filename not in checksums:
            raise ValueError(f"Checksum manifest is missing {filename}")

    updated = replace_once(source, r'^  version "[^"]+"$', f'  version "{version}"')
    updated = replace_once(
        updated,
        r'^  sha256 arm:   "[0-9a-f]{64}",\n         intel: "[0-9a-f]{64}"$',
        f'  sha256 arm:   "{checksums[FILENAMES["arm"]]}",\n'
        f'         intel: "{checksums[FILENAMES["intel"]]}"',
    )
    if updated != source:
        if version_key(version) == version_key(current.group(1)):
            raise ValueError("Refusing checksum changes for an already pinned release")
        for filename in FILENAMES.values():
            verify_download(assets[filename], checksums[filename])
        print("Verified both macOS DMG downloads")
        CASK.write_text(updated)
        print(f"Updated {CASK.name} to {tag}")
    else:
        print(f"Already current: {tag}")


if __name__ == "__main__":
    main()
