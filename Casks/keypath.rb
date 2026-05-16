cask "keypath" do
  version "1.0.0-beta3"
  sha256 "fbe32cf69932426e2693020b8a707c02ac2ced264dabb445cf871d0c4bd0104e"

  url "https://github.com/malpern/KeyPath/releases/download/v#{version}/KeyPath-#{version}.dmg"
  name "KeyPath"
  desc "Keyboard remapping for macOS powered by Kanata. Keys that do more."
  homepage "https://keypath-app.com"

  depends_on macos: ">= :sequoia"

  app "KeyPath.app"

  zap trash: [
    "~/.config/keypath",
    "~/Library/Logs/KeyPath",
    "~/Library/Preferences/com.keypath.KeyPath.plist",
  ]
end
