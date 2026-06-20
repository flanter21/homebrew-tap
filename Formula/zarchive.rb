class Zarchive < Formula
  desc "Library for creating and reading zstd-compressed file archives (.zar)"
  homepage "https://github.com/Exzap/ZArchive"
  url "https://github.com/Exzap/ZArchive/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "676e2c6eb9a2aeece702a53f39ecf8f057bc4e032071ec6ee23e5ac6e358ceed"
  license "MIT-0"
  head "https://github.com/DevYukine/rom-converto.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end
end
