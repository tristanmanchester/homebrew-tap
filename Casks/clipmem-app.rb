cask "clipmem-app" do
  version "0.4.3"
  sha256 "38555f9269cb07740e9405f91dc23bd2cf088ab1092d66acb76cdd05ce367d7d"

  url "https://github.com/tristanmanchester/clipmem/releases/download/v#{version}/clipmem-app-aarch64-apple-darwin.zip"
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
