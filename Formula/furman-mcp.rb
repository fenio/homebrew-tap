class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.4.0"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "cfdd721e9a0b521d844d35d7af9fb191b5945c034ebbd71f44d86f4410ecc454"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "904ffd061527868c21ca9e3b9cc6c0968fd22c1bc843ad071cb551438275c6a7"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
