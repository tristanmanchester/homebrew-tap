cask "clipmem-app" do
  version "0.2.11"
  sha256 "4cca674f09fc3deccdedccaf91cc2e4df716ace5204b21cef451c57d998b7a08"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.2.11/clipmem-app-aarch64-apple-darwin.zip"
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
