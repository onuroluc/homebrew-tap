# typed: false
# frozen_string_literal: true

# Homebrew formula for vitals — universal dev environment doctor
# To use: brew tap onuroluc/tap && brew install vitals
#
# This file is a template. The release CI auto-updates the tap repo
# with correct versions and SHA256 sums on each tagged release.
class Vitals < Formula
  desc "Universal development environment doctor — auto-detects and diagnoses project health"
  homepage "https://github.com/onuroluc/vitals"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onuroluc/vitals/releases/download/v#{version}/vitals-darwin-arm64.tar.gz"
      sha256 "0af913098ee6ef4693dc1f31dcf7718b83a888350c83e7e495fecb4172715bc7"
    else
      url "https://github.com/onuroluc/vitals/releases/download/v#{version}/vitals-darwin-amd64.tar.gz"
      sha256 "36e5f66d884d1a5a39c2abdda5e6d4bbe8b2ef9e169e9fe312655dde272f810e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onuroluc/vitals/releases/download/v#{version}/vitals-linux-arm64.tar.gz"
      sha256 "7f69d35137a1a8261c4d7c40e004cc41e9b96cc2a60a47ca33719048a4dc7258"
    else
      url "https://github.com/onuroluc/vitals/releases/download/v#{version}/vitals-linux-amd64.tar.gz"
      sha256 "58215eda5007de85174a4a82d3c90a1aa38d90c3e6d3057ee325e822db401c61"
    end
  end

  def install
    bin.install "vitals"
  end

  test do
    assert_match "vitals", shell_output("#{bin}/vitals --help")
  end
end
