cask "clipmem-app" do
  version "0.5.2"
  sha256 "d201f0b323428b065d8f7082388e2fc07f06de397640ddc74b2b43e1251ff032"

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
