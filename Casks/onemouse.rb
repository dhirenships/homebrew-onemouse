cask "onemouse" do
  version "1.1.0"

  on_arm do
    sha256 "16932def7261e874132915375e5d8ce3c8171a3b6bdfd698572714b2dd687edf"

    url "https://onemouse.app/releases/#{version}/OneMouse-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "2bb58a6500fbc3f8671d8a17c0ed139e95a109a766b9c1fd827f39dd547682ea"

    url "https://onemouse.app/releases/#{version}/OneMouse-#{version}-x64.zip"
  end

  name "OneMouse"
  desc "Share a mouse, keyboard, and clipboard between paired Macs"
  homepage "https://onemouse.app/"

  livecheck do
    skip "Releases are published manually to onemouse.app"
  end

  depends_on :macos

  app "OneMouse.app"

  zap trash: [
    "~/Library/Application Support/mouse",
    "~/Library/Application Support/OneMouse",
    "~/Library/Preferences/com.openmouse.app.plist",
  ]

  caveats <<~EOS
    OneMouse is ad hoc signed and is not notarized. If macOS blocks the first
    launch, open System Settings > Privacy & Security and choose Open Anyway.
    Enable Accessibility and Input Monitoring for OneMouse on each Mac.
    macOS may ask you to re-enable these permissions after an update.
  EOS
end
