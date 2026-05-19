cask "azahar" do
  arch arm: "arm64", intel: "x86_64"

  version "2125.1.2"
  sha256 arm:   "5d3aedc3840cf3b536caea9e9b60811e6c3a07475e2e5a36d816ffcbd58eecb4",
         intel: "8ab5069530564ab6a77f6b2d7180d611d1744bd4c41a9ab9bfb2d1f14420b870"

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-macos-#{arch}-#{version}.zip",
      verified: "github.com/azahar-emu/azahar/"
  name "Azahar"
  desc "Open-source 3DS emulator project based on Citra"
  homepage "https://azahar-emu.org/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "azahar-macos-#{arch}-#{version}/Azahar.app"
  binary "#{appdir}/Azahar.app/Contents/MacOS/azahar"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Azahar.app"
                   ]
  end
end
