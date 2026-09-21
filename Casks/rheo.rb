cask "rheo" do
  version "0.2.2"
  sha256 "4fe8ffc4666b8f21ee86b5defcd93a4977ab5c29cab39f6e263a71fb32c3ba8c"

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
