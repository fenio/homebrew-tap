class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.19"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "56e960778b023941f22aa9059a8efe1d467e60be7579342db9699d35e7b61a1e"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "fe0c5f4c78d72ed360010b52113d745d181bb6e5030802f7ca7796e3b7802683"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
