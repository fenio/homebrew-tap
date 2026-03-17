class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.6"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "66041a6b32ea3b3e8bd36e1d222904f9cdcaa4fa995da53952baad92cb57f9dd"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "9a67f77a0dc1b76cde0b861d7407cea2a0b85a32c162171767a1fb49b3cffb4a"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
