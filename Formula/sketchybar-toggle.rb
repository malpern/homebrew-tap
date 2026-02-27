class SketchybarToggle < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/sketchybar-toggle"
  url "https://github.com/malpern/sketchybar-toggle/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "a41bd6bc34f4b95427106eba6ca7fa28cdc46000f43dacb59098f31d9af1c521"
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
