cask "clipmem-app" do
  version "0.2.9"
  sha256 "8f78d0ebdedb6b3fe399947807ac7cac8d1ddd5a0c7c79e831ec1fe95e9d57ef"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.2.9/clipmem-app-aarch64-apple-darwin.zip"
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
