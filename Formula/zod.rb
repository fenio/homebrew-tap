class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "c4f1edd2819286037f7feb1a7c36b6617191e62669c7043772ace61705cc072f"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-zod-0.3.4"
    sha256 arm64_sonoma: "20b6e5f52a3b789b53483ce6849c801efe715c24c750205ac1e7748e1024939c"
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
