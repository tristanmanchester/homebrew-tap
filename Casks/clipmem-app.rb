cask "clipmem-app" do
  version "0.2.6"
  sha256 "bbcda6e863cbe28fd0fca90498b33bf98a571fcb9503ebc08a12608a94ba119e"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.2.6/clipmem-app-aarch64-apple-darwin.zip"
  name "Clipmem"
  desc "Menu bar app for local clipboard history"
  homepage "https://github.com/tristanmanchester/clipmem"

  depends_on formula: "clipmem"
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "ClipmemMenuBar.app"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/clipmem",
                   args: ["setup"]
  end

  uninstall quit: "io.openclaw.clipmem.menubar"

  zap trash: "~/Library/Preferences/io.openclaw.clipmem.menubar.plist"
end
