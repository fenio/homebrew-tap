class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.7"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "e8a1550439d7b5752d045b1c768cf29175ba1bc5d2531c72b180f395d5cd5545"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "67c39df376efcbbd6724490f9cdb73d506f86d2b52a13c338e39c6c508c571ec"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
