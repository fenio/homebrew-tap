class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.14"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "17b2e8a562bd48c51e7903feef76a42f2033b1e870e15d2cb1a23aa0485dcb89"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "9a875aaab4493159c922854a6d827de4fc6feaec3f8d9c5c72a11b2a95fbcdb2"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
