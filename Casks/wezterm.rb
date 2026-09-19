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
  # Keep this as a legacy `postflight` block so codesign can access the user's
  # login keychain outside the install-steps sandbox.
  postflight do
    app = Pathname("/Applications/WezTerm.app")
    next unless app.exist?

    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", app],
                   must_succeed: false

    plist_message = [
      "Add :NSAppBundlesUsageDescription string WezTerm needs to access",
      "application bundles when a command launched from the terminal manages applications.",
    ].join(" ")
    system_command "/usr/libexec/PlistBuddy",
                   args:         ["-c", plist_message, app/"Contents/Info.plist"],
                   must_succeed: false

    signing_identity = "F9B03D815BD4AD9D3E02892CBC3114B9E6F3E292"
    %w[wezterm-mux-server wezterm strip-ansi-escapes wezterm-gui].each do |tool|
      system_command "/usr/bin/codesign",
                     args: ["--force", "--sign", signing_identity, app/"Contents/MacOS"/tool]
    end
    system_command "/usr/bin/codesign",
                   args: ["--force", "--sign", signing_identity, app]
  end

  uninstall delete: "/Applications/WezTerm.app"

  zap trash: "~/Library/Saved Application State/com.github.wez.wezterm.savedState"

  caveats <<~EOS
    WezTerm command-line tools are linked into Homebrew's binary directory.
  EOS
end
