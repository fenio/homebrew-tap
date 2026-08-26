class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.16"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "289b187ab5a962b8e897ef35d5d577b4ed9bd0f720e51982db2bd8ead179d7ba"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "aa9ed7a69bb42737ad6cd9362cf82d906e90921b5c58e480076633963687dbf3"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
