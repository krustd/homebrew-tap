# NOTE: Updated automatically by the krust/wezterm Gitea Actions workflow.
# vim:ft=ruby:
cask "wezterm" do
  version "20260912-093559-358090ec"
  sha256 "cbd8435f478e06edd0dec161d517f546014262cf846375166596c26eb609912d"

  url "https://krustgitea.iepose.cn/krust/wezterm/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm"
  desc "GPU-accelerated cross-platform terminal emulator and multiplexer"
  homepage "https://wezterm.org/"

  app "WezTerm.app"

  %w[
    wezterm
    wezterm-gui
    wezterm-mux-server
    strip-ansi-escapes
  ].each do |tool|
    binary "#{appdir}/WezTerm.app/Contents/MacOS/#{tool}"
  end

  preflight do
    # Move "WezTerm-macos-#{version}/WezTerm.app" out of the subfolder
    staged_subfolder = staged_path.glob(["WezTerm-*", "wezterm-*"]).first
    if staged_subfolder
      FileUtils.mv(staged_subfolder/"WezTerm.app", staged_path)
      FileUtils.rm_r(staged_subfolder)
    end
  end

  # These builds are ad-hoc signed rather than notarized, and Homebrew
  # quarantines the download, so Gatekeeper would refuse to launch the app.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/WezTerm.app"],
                   must_succeed: false
  end

  zap trash: "~/Library/Saved Application State/com.github.wez.wezterm.savedState"

  caveats <<~EOS
    WezTerm command-line tools are linked into Homebrew's binary directory.
  EOS
end
