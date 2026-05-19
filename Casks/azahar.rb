# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "azahar" do
  arch arm: "arm64", intel: "x86_64"
  version "2125.1.2"
  sha256 "5d3aedc3840cf3b536caea9e9b60811e6c3a07475e2e5a36d816ffcbd58eecb4"

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-macos-#{arch}-#{version}.zip"
    verified: "github.com/azahar-emu/azahar/"
  name "Azahar"
  desc " An open-source 3DS emulator project based on Citra."
  homepage "https://azahar-emu.org/"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: ">= :ventura"

  app "azahar-macos-#{arch}-#{version}/Azahar.app"
  binary "#{appdir}/Azahar.app/Contents/MacOS/azahar"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Azahar.app"
                   ]
  end

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
