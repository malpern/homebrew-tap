class SketchybarToggle < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/sketchybar-toggle"
  url "https://github.com/malpern/sketchybar-toggle/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "2e6188131496975d2f6a6cba86dcf4c693310b8bd47bfb37845e86ad62a5798b"
  license "MIT"
  head "https://github.com/malpern/sketchybar-toggle.git", branch: "main"

  depends_on macos: :ventura
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/sketchybar-toggle"
  end

  def caveats
    <<~EOS
      sketchybar-toggle requires Input Monitoring permission.
      Grant it in System Settings > Privacy & Security > Input Monitoring.

      To auto-start with SketchyBar, run:
        sketchybar-toggle --setup
    EOS
  end

  test do
    assert_match "sketchybar-toggle 0.3.0", shell_output("#{bin}/sketchybar-toggle --version")
  end
end
