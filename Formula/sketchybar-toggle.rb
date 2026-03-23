class SketchybarToggle < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/sketchybar-toggle"
  url "https://github.com/malpern/sketchybar-toggle/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "fcbdcd1027f5777b2e64d7b523c10dfac131e955204d985a90c6297f1dcb65d1"
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
      To auto-start with SketchyBar, run:
        sketchybar-toggle --setup
    EOS
  end

  test do
    assert_match "sketchybar-toggle 0.5.0", shell_output("#{bin}/sketchybar-toggle --version")
  end
end
