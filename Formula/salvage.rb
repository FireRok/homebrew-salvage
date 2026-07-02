# typed: false
# frozen_string_literal: true

# Salvage — prove your backups actually restore.
# This formula is updated automatically by the release pipeline (goreleaser).
class Salvage < Formula
  desc "Restore-test your backups and attest the results"
  homepage "https://salvage.sh"
  version "0.2.1"
  license "FSL-1.1-ALv2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/firerok/salvage/releases/download/v0.2.1/salvage_0.2.1_darwin_arm64.tar.gz"
      sha256 "d28f45ad1236c0538b3f588e3dbe358867cb2c3e2174d7c5f00a695ba1a01a50"
    else
      url "https://github.com/firerok/salvage/releases/download/v0.2.1/salvage_0.2.1_darwin_amd64.tar.gz"
      sha256 "e7c70ba291f522c4b2ed535ed7bc437df31ecfd7fbd483204a29d278db8add05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/firerok/salvage/releases/download/v0.2.1/salvage_0.2.1_linux_arm64.tar.gz"
      sha256 "f6d0140c5f35c61977028cefd609eaa0221c1c8ae66e130aec82235ba9860a44"
    else
      url "https://github.com/firerok/salvage/releases/download/v0.2.1/salvage_0.2.1_linux_amd64.tar.gz"
      sha256 "75c3285c6d18aac56afcebede84da75e64311e67dda2674a7263a5c53e567dbd"
    end
  end

  def install
    bin.install "salvage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/salvage version")
  end
end
