class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.5"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "d3995c4acda71ea179948ece2806be3ffdf673950822a2a56bf2d1a54e8f9073"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "63f719dd1ce421208dc88e08ed61539649c96ed2d53f35f53587a2a08ea7a441"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
