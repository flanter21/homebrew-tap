class RomConvertoCli < Formula
  desc "Suite for converting, (de)compressing, encrypting and decrypting ROMs"
  homepage "https://github.com/DevYukine/rom-converto"
  url "https://github.com/DevYukine/rom-converto/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "0495e46aeab299a14b309a08d0ef9abe6346a98e824cd63b81a5cb8ea5244c94"
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
