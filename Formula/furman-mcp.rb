class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.10"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "9d311c31129e0cec6b34f1364873f8f8779c3116d801c6af8dc6335a263ad203"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "44f92a4ec782c2271b15e0c2343aa52ad8f74df3a48d7cbf9e34fc1d278d5a20"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
