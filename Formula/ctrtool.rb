class Ctrtool < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/ctrtool-v1.3.0.tar.gz"
  version "1.3.0"
  sha256 "6c0314928dea722f769cfa7257a963df0d7503962b2998a8c91ec6879fb86075"
  license "MIT"
  head "https://github.com/3DSGuy/Project_CTR.git", branch: "master"

  livecheck do
    url "https://github.com/3DSGuy/Project_CTR/tags"
    regex(/(1(?:\.\d+)+)/i)
  end

  def install
    cd "ctrtool" do
      system "make", "deps"
      system "make"
      bin.install "bin/ctrtool"
    end
  end
end
