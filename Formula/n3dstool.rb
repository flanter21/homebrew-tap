class N3dstool < Formula
  desc "All-in-one tool for extracting/creating 3ds roms"
  homepage "https://github.com/dnasdw/3dstool"
  url "https://github.com/dnasdw/3dstool/archive/refs/tags/v#{version}.tar.gz"
  version "1.2.6"
  sha256 "7f6118bfe7b8e1ba87aa547a8cb892c29c9cc45ad817ee822121fa2142044859"
  license "MIT"
  head "https://github.com/dnasdw/3dstool.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", "-DUSE_DEP=OFF", "-S", ".", "-B", "build", *std_cmake_args
    system "make", "-C", "build"
    bin.install "bin/Release/3dstool"
  end
end
