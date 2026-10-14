class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.20"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "651b1b5b60c5e05b81224d22cf69547e0e2adbff073b01d658a97841c6114e7e"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "bfbb2b7b2aaaec4bfc4240eb193671d464af6d978bd906431bb536ae2b20de18"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
