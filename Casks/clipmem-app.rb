cask "clipmem-app" do
  version "0.6.1"
  sha256 "f4de13f88d8107b2c86355748dfc8f9813f6649deef8cc2425b7135b2c9acc89"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v#{version}/clipmem-app-aarch64-apple-darwin.zip"
  name "Clipmem"
  desc "Menu bar app for local clipboard history"
  homepage "https://github.com/tristanmanchester/clipmem"

  depends_on arch: :arm64
  depends_on formula: "clipmem"
  depends_on macos: :sonoma

  app "ClipmemMenuBar.app"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/clipmem",
                   args: ["setup"]
  end

  uninstall quit: "io.openclaw.clipmem.menubar"

  zap trash: "~/Library/Preferences/io.openclaw.clipmem.menubar.plist"
end
