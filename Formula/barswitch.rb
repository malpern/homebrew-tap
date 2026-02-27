class Barswitch < Formula
  desc "Coordinates SketchyBar and the native macOS menu bar"
  homepage "https://github.com/malpern/barswitch"
  url "https://github.com/malpern/barswitch/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9e9a936382c0b034003ec041ee58ab5712bbb2e4eb9f6508c61c5cc6148d1fc1"
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

      To auto-start with SketchyBar, run:
        barswitch --setup
    EOS
  end

  test do
    assert_match "barswitch 0.2.0", shell_output("#{bin}/barswitch --version")
  end
end
