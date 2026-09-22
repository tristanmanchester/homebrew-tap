cask "rheo" do
  version "0.2.3"
  sha256 "9cb79068c61abed1e3a6407d994f71387384bccaa21079f5d96ade1508367625"

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
