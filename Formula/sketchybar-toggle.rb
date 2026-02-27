class SketchybarToggle < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/sketchybar-toggle"
  url "https://github.com/malpern/sketchybar-toggle/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "4f121946b4dcd3fb03da00af996d8c3d3706cd8f1a886c008c1c0d7b9eb4e81f"
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
    assert_match "sketchybar-toggle 0.4.0", shell_output("#{bin}/sketchybar-toggle --version")
  end
end
