class RadioCaster < Formula
  include Language::Python::Virtualenv

  desc "Cast internet radio to a Chromecast from the macOS menu bar or command-line"
  homepage "https://github.com/fenio/radio-caster"
  url "https://github.com/fenio/radio-caster/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ede3f4ceb47b3a174f2840a7c90d6f58b2faf9d6694c4a7bc611009ec6a06594"
  license "MIT"

  bottle do
    root_url "https://github.com/fenio/homebrew-tap/releases/download/bottle-radio-caster-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a32fd81655b5951e599199a9ee751971a9b8b445308a49591004961cec30e689"
  end

  depends_on :macos
  depends_on "python@3.15"

  resource "casttube" do
    url "https://files.pythonhosted.org/packages/78/54/f7e80d701c587940cf1c871fb6327b4a2682df4287896fbf9400cd0bbf21/casttube-0.2.1.tar.gz"
    sha256 "54d2af8c7949aa9c5db87fb11ef0a478a5d3e7ac6d2d2ac8dd1711e3a516fc82"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771/certifi-2026.10.18.tar.gz"
    sha256 "b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89/charset_normalizer-3.5.2.tar.gz"
    sha256 "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "ifaddr" do
    url "https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791/ifaddr-0.2.0.tar.gz"
    sha256 "cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/d9/89/5b8517baa72f84a67b8a307ba953c91057af618bf40bf676f3c03551f8f0/protobuf-7.36.2.tar.gz"
    sha256 "497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb"
  end

  resource "pychromecast" do
    url "https://files.pythonhosted.org/packages/3a/1f/d78497441334d24740cce0a92394c33972a9d6a17b607d0ec976f0f48a35/pychromecast-14.0.10.tar.gz"
    sha256 "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"
  end

  resource "pyobjc-core" do
    url "https://files.pythonhosted.org/packages/a5/78/abc4ce5920305780aeb36b4067a86253378b36e29ba96673a3deb02eb03a/pyobjc_core-12.2.2.tar.gz"
    sha256 "3906452339cd06a3bb07df103c2511d4cb0f7a22d8771c0b802eba15d9a642b6"
  end

  resource "pyobjc-framework-cocoa" do
    url "https://files.pythonhosted.org/packages/75/76/49c6da2c6a831020b4854ba20079d5a1030474bffc776b7b73c2eeff8c15/pyobjc_framework_cocoa-12.2.2.tar.gz"
    sha256 "c96c0ef69a71afbbb0e6a7d594b455c5fe47d62e0db376ee7a2b4b828c16ace9"
  end

  resource "pyobjc-framework-webkit" do
    url "https://files.pythonhosted.org/packages/6f/1f/766e338197f7051c25f23cb0d350caa88234b31c3a759127f2cbb67f3376/pyobjc_framework_webkit-12.2.2.tar.gz"
    sha256 "e5588df2a73b377b59a994cc2a78b467e4341f4e4d28b52e8671e21a2811d3c1"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "rumps" do
    url "https://files.pythonhosted.org/packages/b2/e2/2e6a47951290bd1a2831dcc50aec4b25d104c0cf00e8b7868cbd29cf3bfe/rumps-0.4.0.tar.gz"
    sha256 "17fb33c21b54b1e25db0d71d1d793dc19dc3c0b7d8c79dc6d833d0cffc8b1596"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  resource "zeroconf" do
    url "https://files.pythonhosted.org/packages/93/20/69744d9de9d375dae2639dda9add7dae85d52d690b68c61b23b8a6468434/zeroconf-0.151.5.tar.gz"
    sha256 "28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"radio-caster", "menubar"]
    # Restart after a crash, but stay stopped when quit from the menu.
    keep_alive successful_exit: false
    process_type :interactive
    log_path var/"log/radio-caster.log"
    error_log_path var/"log/radio-caster.log"
  end

  def caveats
    <<~EOS
      Start the menu bar app now and at every login:
        brew services start radio-caster

      For Radio Caster in Spotlight and Applications:
        brew install --cask fenio/tap/radio-caster-app

      Or use the command line:
        radio-caster search "jazz"
        radio-caster 357

      Favourites live in ~/.config/radio-caster/stations.json.
    EOS
  end

  test do
    assert_match "list favourites", shell_output("#{bin}/radio-caster --help")
  end
end
