require_relative "../require/macfuse"
class WiimmsIsoTools < Formula
  desc "Extract, modify and create Wii and GameCube ISO images and WBFS containers"
  homepage "https://wit.wiimm.de"
  url "https://download.wiimm.de/source/wiimms-iso-tools/wiimms-iso-tools.source-3.05a.txz"
  sha256 "e5a8a488f26465ff4ec03f10990ee28e104eb4542990812bbdbea03af12ed8bd"
  license "GPL-2.0-or-later"
  head "https://github.com/Wiimm/wiimms-iso-tools.git", branch: "master"

  depends_on MacfuseRequirement
  depends on :macos

  patch :DATA

  def install
    setup_fuse
    # (buildpath/"libbz2").mkpath
    dir = build.head? ? "project" : "."

    cd dir do
      with_env(
        "MACOSX_DEPLOYMENT_TARGET" => "10.10",
        "SYSTEM"                   => "mac",
        "INSTALL_PATH"             => bin.to_s,
      ) do
        system "make", "-j1", "flags", "distrib"
      end
      bin.install "bin/wwt"
      bin.install "bin/wit"
      bin.install "bin/wdf"
      bin.install "bin/wfuse"

      # Add manfiles
      File.write("wit.1", ".nf\n#{File.read("doc/wit.txt")}.fi")
      File.write("wwt.1", ".nf\n#{File.read("doc/wwt.txt")}.fi")
      man1.install "wit.1"
      man1.install "wwt.1"
    end
  end
end
__END__
diff --git a/makefiles-local/Makefile.local.mac b/makefiles-local/Makefile.local.mac
index 6a4a25d..1193951 100644
--- a/makefiles-local/Makefile.local.mac
+++ b/makefiles-local/Makefile.local.mac
@@ -83,7 +83,7 @@ mac-i386:
 mac-x86_64:
 	@echo
 	@echo "----- building X86-64 -----"
-	@XFLAGS="-arch x86_64 -mfpmath=sse" make clean all
+	@XFLAGS="-arch arm64" make clean all
 	@mkdir -p bin/x86_64
 	@mv $(MAIN_TOOLS) bin/x86_64
 
