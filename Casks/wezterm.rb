# NOTE: Updated automatically by the krust/wezterm Gitea Actions workflow.
# vim:ft=ruby:
cask "wezterm" do
  version "20260912-093559-358090ec"
  sha256 "cbd8435f478e06edd0dec161d517f546014262cf846375166596c26eb609912d"

  url "https://krustgitea.iepose.cn/krust/wezterm/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm"
  desc "GPU-accelerated cross-platform terminal emulator and multiplexer"
  homepage "https://wezterm.org/"

  depends_on :macos

  app "WezTerm.app"

  %w[
    wezterm
    wezterm-gui
    wezterm-mux-server
    strip-ansi-escapes
  ].each do |tool|
    binary "#{appdir}/WezTerm.app/Contents/MacOS/#{tool}"
  end

  # Move "WezTerm-macos-#{version}/WezTerm.app" out of the subfolder
  preflight_steps do
    if_path_exists "{WezTerm-*,wezterm-*}/WezTerm.app" do
      move "{WezTerm-*,wezterm-*}/WezTerm.app", ".", source_glob: true
      remove "{WezTerm-*,wezterm-*}", recursive: true
    end
  end

  # The release is built in CI without a distributable Apple identity. Re-sign
  # it on this Mac with the same long-lived local identity after installation.
  # Explicitly grant the install-step access to the login keychain; unlike the
  # legacy postflight block, postflight_steps runs inside Homebrew's sandbox.
  postflight_steps do
    if_path_exists "/Applications/WezTerm.app" do
      run "/usr/bin/xattr",
          args:           ["-dr", "com.apple.quarantine", "/Applications/WezTerm.app"],
          must_succeed:   false,
          writable_paths: ["/Applications"]

      run "/usr/libexec/PlistBuddy",
          args:           ["-c",
                           "Add :NSAppBundlesUsageDescription string WezTerm needs to access " \
                           "application bundles when a command launched from the terminal manages applications.",
                           "/Applications/WezTerm.app/Contents/Info.plist"],
          must_succeed:   false,
          writable_paths: ["/Applications"]

      run "/usr/bin/codesign",
          args:           ["--force", "--sign", "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292",
                           "--keychain", "/Users/{{user}}/Library/Keychains/login.keychain-db",
                           "/Applications/WezTerm.app/Contents/MacOS/wezterm-mux-server"],
          writable_paths: ["/Users/{{user}}/Library/Keychains/login.keychain-db"]
      run "/usr/bin/codesign",
          args:           ["--force", "--sign", "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292",
                           "--keychain", "/Users/{{user}}/Library/Keychains/login.keychain-db",
                           "/Applications/WezTerm.app/Contents/MacOS/wezterm"],
          writable_paths: ["/Users/{{user}}/Library/Keychains/login.keychain-db"]
      run "/usr/bin/codesign",
          args:           ["--force", "--sign", "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292",
                           "--keychain", "/Users/{{user}}/Library/Keychains/login.keychain-db",
                           "/Applications/WezTerm.app/Contents/MacOS/strip-ansi-escapes"],
          writable_paths: ["/Users/{{user}}/Library/Keychains/login.keychain-db"]
      run "/usr/bin/codesign",
          args:           ["--force", "--sign", "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292",
                           "--keychain", "/Users/{{user}}/Library/Keychains/login.keychain-db",
                           "/Applications/WezTerm.app/Contents/MacOS/wezterm-gui"],
          writable_paths: ["/Users/{{user}}/Library/Keychains/login.keychain-db"]
      run "/usr/bin/codesign",
          args:           ["--force", "--sign", "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292",
                           "--keychain", "/Users/{{user}}/Library/Keychains/login.keychain-db",
                           "/Applications/WezTerm.app"],
          writable_paths: ["/Users/{{user}}/Library/Keychains/login.keychain-db"]
    end
  end

  uninstall delete: "/Applications/WezTerm.app"

  zap trash: "~/Library/Saved Application State/com.github.wez.wezterm.savedState"

  caveats <<~EOS
    WezTerm command-line tools are linked into Homebrew's binary directory.
  EOS
end
