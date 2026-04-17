class Clipmem < Formula
  desc "macOS clipboard memory backed by SQLite and searchable from OpenClaw"
  homepage "https://github.com/tristanmanchester/clipmem"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tristanmanchester/clipmem/releases/download/v0.1.2/clipmem-aarch64-apple-darwin.tar.xz"
    sha256 "b9a93ed262c51c712e75e20897dd32be1a83b486b11f0218c4df20e55891033b"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "clipmem" if OS.mac? && Hardware::CPU.arm?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
