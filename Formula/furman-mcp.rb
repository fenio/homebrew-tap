class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.18"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "ca30392d531b25d569cc493f749a4fac08e569db69d8f56fe9d09c9b56585e0f"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "ac1747f20fe43962ee37f3b750dc7bffbf8fa6e92dca0115c3164985ece2a890"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
