class Clipmem < Formula
  desc "macOS clipboard memory backed by SQLite and searchable from OpenClaw"
  homepage "https://github.com/tristanmanchester/clipmem"
  url "https://github.com/tristanmanchester/clipmem/releases/download/v0.3.1/clipmem-aarch64-apple-darwin.tar.xz"
  sha256 "e152c03aec60d3b4923a68965fb1a39bd4670bd5c8b88e9a91df76f51d35ba0a"
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
    bin.install "clipmem"

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
