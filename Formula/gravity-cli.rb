class GravityCli < Formula
  desc "Command-line access to Gravity notes for AI agents and scripts."
  homepage "https://gravitynotes.app"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tristanmanchester/homebrew-tap/releases/download/gravity-cli-v0.1.0/gravity-cli-aarch64-apple-darwin.tar.xz"
      sha256 "87fead4ab5f19aa416f467ce08d395106a61f18e533e89db602c2d342ce79877"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tristanmanchester/homebrew-tap/releases/download/gravity-cli-v0.1.0/gravity-cli-x86_64-apple-darwin.tar.xz"
      sha256 "f2628669299c9dcefefd21c567cec0ed22f3f5d1f241626f2e01927992ab6b68"
    end
  end
  license "UNLICENSED"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin":  {},
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gravity"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gravity"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
