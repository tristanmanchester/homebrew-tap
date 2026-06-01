cask "clipmem-app" do
  version "0.5.5"
  sha256 "5e9133eb16f03e6d1f04d63c09ed0df5ecfb7d6a16fb6df48525e83c463e135c"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v#{version}/clipmem-app-aarch64-apple-darwin.zip"
  name "Clipmem"
  desc "Menu bar app for local clipboard history"
  homepage "https://github.com/tristanmanchester/clipmem"

  depends_on formula: "clipmem"
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ClipmemMenuBar.app"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/clipmem",
                   args: ["setup"]
  end

  uninstall quit: "io.openclaw.clipmem.menubar"

  zap trash: "~/Library/Preferences/io.openclaw.clipmem.menubar.plist"
end
