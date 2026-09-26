class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.17"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "0472ca7d626bbc3e4edb7a8279db9b9b7c57636d39c78f991a93eb39efde3a50"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "505bd08b862d7888c40cbd89195e8936109d1dc34cbe4a339d8f2b02df6b2af9"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
