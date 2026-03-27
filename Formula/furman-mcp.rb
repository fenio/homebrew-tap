class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.9"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "ec0c14c122f174523f0a1e8f47b2cb8a0eb3d6f9ac8a4a747ae7882827dd01e0"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "3d6057b1c880a0a4087be1bf54ba1e96f373e7de254a16246570dc7bcbcea7fa"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
