class FurmanMcp < Formula
  desc "MCP server for S3 and SFTP operations (Furman)"
  homepage "https://github.com/fenio/furman"
  version "0.3.15"
  license "GPL-3.0-only"

  on_arm do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-aarch64-apple-darwin"
    sha256 "baceef311000f72962ce5f9567857a1c3dd34fd122fd93c009b09f26848cd2f2"
  end
  on_intel do
    url "https://github.com/fenio/furman/releases/download/v#{version}/furman-mcp-x86_64-apple-darwin"
    sha256 "43baefba38755c491a4e97b3a021f7a03541f1861be0aba527a4045ad388dd65"
  end

  def install
    bin.install Dir["furman-mcp-*"].first => "furman-mcp"
  end
end
