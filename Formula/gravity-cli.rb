class GravityCli < Formula
  desc "Command-line access to Gravity notes for AI agents and scripts."
  homepage "https://gravitynotes.app"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tristanmanchester/homebrew-tap/releases/download/gravity-cli-v0.2.0/gravity-cli-aarch64-apple-darwin.tar.xz"
      sha256 "439b560cc707cf8f86bdf08ff725a9de76199ae97fee5ea636dc9516738db9da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tristanmanchester/homebrew-tap/releases/download/gravity-cli-v0.2.0/gravity-cli-x86_64-apple-darwin.tar.xz"
      sha256 "3d66153f27e7885b77789ddad9b0e96873479595cd28be63277b59e7daf32af5"
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
