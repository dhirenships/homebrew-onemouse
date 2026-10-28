cask "onemouse" do
  version "1.1.1"

  on_arm do
    sha256 "c1d2b59be3c12ec323b1132d0d8b05f94ae9c65f7b9731f4f251038095f33197"

    url "https://onemouse.app/releases/#{version}/OneMouse-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "0ba0cee12edec7fb9d89f210f263a404eee83372c570ad093edd31d4b942b4c7"

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
    OneMouse is signed with its own certificate and is not notarized. This cask
    removes the download quarantine from OneMouse.app so macOS opens it without
    a warning. On first launch OneMouse asks for Accessibility; turn it on for
    OneMouse in System Settings on each Mac. The approval carries over to updates.
  EOS
end
