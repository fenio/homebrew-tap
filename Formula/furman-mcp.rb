class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.11"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "528c769a2cbe0fc248d1b8296a2f9832a4c2f9246faf844fe92f31d1bcc12378"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "84897295c7d6b72e1eab29647b9593539c48acb53105af0a3f19675b896996cb"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
