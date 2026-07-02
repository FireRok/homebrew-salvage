# typed: false
# frozen_string_literal: true

# Salvage — prove your backups actually restore.
# This formula is updated automatically by the release pipeline (goreleaser).
class Salvage < Formula
  desc "Restore-test your backups and attest the results"
  homepage "https://salvage.sh"
  version "0.2.0"
  license "FSL-1.1-ALv2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/firerok/salvage/releases/download/v0.2.0/salvage_0.2.0_darwin_arm64.tar.gz"
      sha256 "f5827e78649742f7a21b28f4451cf7a70f922688fc3818ae47d9c16e8f116be7"
    else
      url "https://github.com/firerok/salvage/releases/download/v0.2.0/salvage_0.2.0_darwin_amd64.tar.gz"
      sha256 "a44fd17105258c036b351140e67a29be7839237a6602941ce51e321bbd2854e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/firerok/salvage/releases/download/v0.2.0/salvage_0.2.0_linux_arm64.tar.gz"
      sha256 "b83f9b2578546d820061033a75646d4bb5fd655f263afb58e33a1714c55426c2"
    else
      url "https://github.com/firerok/salvage/releases/download/v0.2.0/salvage_0.2.0_linux_amd64.tar.gz"
      sha256 "2c28d2a34086e7d129a93373a5d268b1d4072353c8257b21d6c1a6ecdc8881bd"
    end
  end

  def install
    bin.install "salvage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/salvage version")
  end
end
