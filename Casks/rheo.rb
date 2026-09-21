cask "rheo" do
  version "0.2.0"
  sha256 "2a1b082a326397b9c6a9f86d285ac62321ea8b8f7e8474547ffdbd9e803d9461"

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
