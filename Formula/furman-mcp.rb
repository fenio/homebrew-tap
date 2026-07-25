class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.13"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "b312adda37b3cf8fd2fc0e23101a76748ad8a8a0b26ae13a4671bb3fdca8a057"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "48e901384f3eae589db246db01052062bfafd115a097cda59e8f6b78d0911b40"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
