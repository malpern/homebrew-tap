class SketchybarToggle < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/sketchybar-toggle"
  url "https://github.com/malpern/sketchybar-toggle/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "27f81d153ff4e3086f2bb008fa62201d4b01c3e0df42e37f32497f501a02f4c1"
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
    assert_match "sketchybar-toggle 0.3.2", shell_output("#{bin}/sketchybar-toggle --version")
  end
end
