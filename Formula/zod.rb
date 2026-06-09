class Zod < Formula
  desc "Modernized SDL2 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "403d19053397fa65a341b5eb4aca73b4dc9f9d2ca1ade32b1c851f0c43356ee2"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-zod-0.1.0"
    sha256 arm64_sonoma: "a9212ddc4f9b580bdb56e09e377eae7293ca92c64b7d75970ebba5f827cfc554"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_mixer"
  depends_on "sdl2_ttf"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists bin/"zod"
  end
end
