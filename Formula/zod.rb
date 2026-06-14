class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "e9809fae94d6e5f567f61c53825b343bc740db831d2c4727b2da1cbaed98a5c3"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-zod-0.4.3"
    sha256 arm64_sonoma: "67ae61c1e53f479ebc570552c8c6be6ef8a15f36b3fd047ef98ba4baed181e0d"
  end







  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl3"
  depends_on "sdl3_image"
  depends_on "sdl3_mixer"
  depends_on "sdl3_ttf"

  def install
    system "cmake", "-S", ".", "-B", "build", "-DZOD_VERSION=v#{version}", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists bin/"zod"
  end
end
