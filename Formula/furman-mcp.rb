class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.8"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "eded4d0c0cbef17f4599d9eedd94ea8c5a5ddd844144f49ae6842c415b251b4e"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "483fdc294e41846b0d2730c5fc48744fcceca0ae1a911bb7d6b2b1b5e1bbb75d"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
