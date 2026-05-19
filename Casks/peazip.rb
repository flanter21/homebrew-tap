cask "peazip" do
  arch arm: "aarch64", intel: "x86_64"

  version "10.9.0"
  sha256 arm:   "f65895eda795dbcf482ba507ba98c0f40ea54849c919c59ef7a9cff19a5541dc",
         intel: "eacf20bdf47fbd6f360cc41220916426758841054c19881dc80bc9e3c5760b60"

  # github.com/rogeriopradoj/homebrew-cask-peazip/ was verified as official when first introduced to the cask
  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "PeaZip"
  desc "Free file archiver utility"
  homepage "https://peazip.github.io/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "peazip.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/peazip.app"
                   ]
  end

  caveats <<~EOS
    1. You may need to run the following command to use PeaZip.app (*):

      xattr -dr com.apple.quarantine /Applications/peazip.app

    2. As PeaZip's compiled binaries are unsigned, they will ask for permission to access certain paths on your machine the first time. On most macOS system versions it is sufficient to respond "OK" once to the system's permission request.#{"      "}

    (*) If the system shows the error message "peazip.app is damaged and can't be opened. You should move it to the Trash" or "peazip.app cannot be opened because the developer cannot be verified" the first time you run PeaZip, it simply means Safari has applied the "quarantine" attribute to the downloaded app package. Those warning messages are issue because the application's binaries are not signed (M1 version is simply ad-hoc signed, Intel version is not signed): to fix the error open the Terminal and run the aforementioned xattr command.
  EOS
end
