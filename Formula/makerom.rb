class Makerom < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/makerom-v#{version}.tar.gz"
  version "0.19.0"
  sha256 "446bd23919b7e9fa10540a784202d388a0b93ef4d7165f3990481edd2aa2f946"
  license "MIT"
  head "https://github.com/3DSGuy/Project_CTR.git", branch: "master"

  livecheck do
    url "https://github.com/3DSGuy/Project_CTR/tags"
    regex(/(0(?:\.\d+)+)/i)
  end

  def install
    cd "makerom" do
      system "make", "deps"
      system "make"
      bin.install "bin/makerom"
    end
  end
end
