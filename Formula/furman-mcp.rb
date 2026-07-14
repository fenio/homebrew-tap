class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.12"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "604bdc864593da8ab6513cb203defb7d3cf4dc977375a29c6e671bd8e2ea6a3b"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "09fe101b56e4541d7d1084e9501f85a43be75f06b63b1c61df8db3fc7aca32e2"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
