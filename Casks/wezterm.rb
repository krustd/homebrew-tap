# NOTE: Updated automatically by the krust/wezterm Gitea Actions workflow.
# vim:ft=ruby:
cask "wezterm" do
  version "20240203-110809-5046fc22"
  sha256 "e77388cad55f2e9da95a220a89206a6c58f865874a629b7c3ea3c162f5692224"

  url "https://krustgitea.iepose.cn/krust/wezterm/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm"
  desc "GPU-accelerated cross-platform terminal emulator and multiplexer"
  homepage "https://wezterm.org/"

  conflicts_with cask: "wezterm"

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

  zap trash: "~/Library/Saved Application State/com.github.wez.wezterm.savedState"

  caveats <<~EOS
    WezTerm command-line tools are linked into Homebrew's binary directory.
  EOS
end
