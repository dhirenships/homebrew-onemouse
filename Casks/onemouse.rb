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

  # OneMouse is not notarized, so Gatekeeper refuses a quarantined copy. The user
  # chose to install it from this tap; clear the download quarantine so it opens.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-d", "-r", "com.apple.quarantine", "{{appdir}}/OneMouse.app"],
        must_succeed:   false,
        writable_paths: ["OneMouse.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/mouse",
    "~/Library/Application Support/OneMouse",
    "~/Library/Preferences/com.openmouse.app.plist",
  ]

  caveats <<~EOS
    OneMouse is ad hoc signed and is not notarized. This cask removes the
    download quarantine from OneMouse.app so macOS opens it without a warning.
    Enable Accessibility and Input Monitoring for OneMouse on each Mac.
    macOS may ask you to re-enable these permissions after an update.
  EOS
end
