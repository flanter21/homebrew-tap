class Makerom < Formula
  desc "General purpose reading/extraction tool for Nintendo 3DS file formats"
  homepage "https://github.com/3DSGuy/Project_CTR"
  url "https://github.com/3DSGuy/Project_CTR/archive/refs/tags/makerom-v#{version}.zip"
  version "0.19.0"
  sha256 "fedd50988ea86b85786da2ea07ee6927673a187265a3cada8c9ee74abf954980"
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
