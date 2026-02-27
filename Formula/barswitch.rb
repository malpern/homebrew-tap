class Barswitch < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/barswitch"
  url "https://github.com/malpern/barswitch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c6f1320b8ca9135636bcb898bfdf27f11c667c2067854e44d7dbf189b257cc5e"
  license "MIT"
  head "https://github.com/malpern/barswitch.git", branch: "main"

  depends_on macos: :ventura
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/barswitch"
  end

  def caveats
    <<~EOS
      BarSwitch requires Input Monitoring permission.
      Grant it in System Settings > Privacy & Security > Input Monitoring.

      To auto-start with SketchyBar, add to your sketchybar config:

        Lua:   sbar.exec("barswitch &")
        Shell: barswitch &
    EOS
  end

  test do
    assert_match "barswitch 0.1.0", shell_output("#{bin}/barswitch --version")
  end
end
