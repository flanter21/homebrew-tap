cask "peazip" do
  arch arm: "aarch64", intel: "x86_64"

  version "11.1.0"
  sha256 arm:   "d339834e46e3f2d1c1db9774eca3c936f37405128add4f83151678d290ca54b1",
         intel: "ebca7bd5250826039cef0448ee861fdabbe6e353c0b195c9108adaa9c0b3e3ea"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "PeaZip"
  desc "Free file archiver utility"
  homepage "https://peazip.github.io/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :big_sur

  app "peazip.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/peazip.app"
                   ]
  end
end
