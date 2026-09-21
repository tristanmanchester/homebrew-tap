cask "rheo" do
  version "0.2.1"
  sha256 "202cd71127b573046df727887125445734ec4a4a609f358172d8f37faabc911e"

  url "https://github.com/tristanmanchester/rheo/releases/download/v#{version}/Rheo-#{version}-universal.zip"
  name "Rheo"
  desc "Instant Space switching"
  homepage "https://github.com/tristanmanchester/rheo"

  depends_on macos: :sequoia

  app "Rheo.app"
  binary "#{appdir}/Rheo.app/Contents/MacOS/rheo"

  uninstall quit: "dev.rheo.app"

  caveats <<~EOS
    Start Rheo with: open -a Rheo
    Enable Rheo in System Settings > Privacy & Security > Accessibility.
  EOS
end
