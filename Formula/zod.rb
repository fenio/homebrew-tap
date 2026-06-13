class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "48905a684c9d92485e09580ed225e2ccb3e346e56ebe054ac0036dff78941696"
  license "GPL-3.0-or-later"






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
