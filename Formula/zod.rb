class Zod < Formula
  desc "Modernized SDL3 build of the Zod Engine (remake of the 1996 RTS 'Z')"
  homepage "https://github.com/fenio/zod"
  url "https://github.com/fenio/zod/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "1c1596e6dcb0c1d979ff5e769245dc883b931e23362772d7a28c3d4a45308e89"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-zod-0.3.2"
    sha256 arm64_sonoma: "2a5f65d68a89529aa0b4bc41d82004524b17687558c485746d694facaa2bf65c"
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
