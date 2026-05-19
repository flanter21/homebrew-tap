class N3dstool < Formula
  desc "All-in-one tool for extracting/creating 3ds roms"
  homepage "https://github.com/dnasdw/3dstool"
  url "https://github.com/dnasdw/3dstool/archive/refs/tags/v#{version}.zip"
  version "1.2.6"
  sha256 "8408d0cb2ac550d654e728b981291a15b415ff8e5eeaba6aa478849d3c6a6896"
  license "MIT"
  head "https://github.com/dnasdw/3dstool.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", "-DUSE_DEP=OFF", "-S", ".", "-B", "build", *std_cmake_args
    system "make", "-C", "build"
    bin.install "bin/Release/3dstool"
  end
end
