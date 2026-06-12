class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ecd1fcd14fbe601d4ab1117be53a7e6be1fb871cc91355ff9eff3e95273821b9"
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
