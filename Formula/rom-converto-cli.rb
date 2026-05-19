# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RomConvertoCli < Formula
  desc "Suite for converting, compressing, decompressing, encrypting, and decrypting ROMs"
  homepage "https://github.com/DevYukine/rom-converto"
  url "https://github.com/DevYukine/rom-converto/archive/refs/tags/v0.8.0.zip"
  sha256 "149bea67b4ad7956bd1d8e4df71c490877d94f379265d4ce6798cd1307648717"
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
