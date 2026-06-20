class RomConvertoCli < Formula
  desc "Suite for converting, (de)compressing, encrypting and decrypting ROMs"
  homepage "https://github.com/DevYukine/rom-converto"
  url "https://github.com/DevYukine/rom-converto/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "b67d68db2b072e4c27a56a2f2e3c2bea60bb7231567cca862d22be194c2fc759"
  license "MIT"
  head "https://github.com/DevYukine/rom-converto.git", branch: "main"

  livecheck do
    url :stable
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/rom-converto-cli")
  end
end
