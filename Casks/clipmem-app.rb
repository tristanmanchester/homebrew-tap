cask "clipmem-app" do
  version "0.2.8"
  sha256 "4579aff79a3035509fe1837d6e29853c9a10e622b53c8591ffb08144934fb370"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.2.8/clipmem-app-aarch64-apple-darwin.zip"
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
