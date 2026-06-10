class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "179c37dd14fe41f70c28144dbb4250ab30d0b46edaa187c4b43689d822109df9"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-zod-0.3.0"
    sha256 arm64_sonoma: "cd4c82eb98f317379b41de853d7e6cb00544b263582d1de3d603776ac54aa8ac"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl3"
  depends_on "sdl3_image"
  depends_on "sdl3_mixer"
  depends_on "sdl3_ttf"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists bin/"zod"
  end
end
