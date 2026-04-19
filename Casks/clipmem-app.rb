cask "clipmem-app" do
  version "0.2.10"
  sha256 "fc919ff939389a8b9c1eb7a84327beaa8b66909a0f850d0f08c827e11a390bf3"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.2.10/clipmem-app-aarch64-apple-darwin.zip"
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
