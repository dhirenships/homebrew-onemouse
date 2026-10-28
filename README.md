# OneMouse Homebrew tap

[OneMouse](https://onemouse.app/) lets one mouse and keyboard drive several Macs:
move the pointer past a screen edge and keep typing, scrolling, and copying on the
next Mac.

```sh
brew install --cask dhirenships/onemouse/onemouse
```

OneMouse runs on macOS 11 or later, on Apple silicon and Intel Macs. The app is
ad hoc signed and not notarized, so the cask clears the download quarantine flag
from `OneMouse.app` after installing it, and macOS opens it without a warning.
Gatekeeper stays on for everything else. Allow **Accessibility** and **Input
Monitoring** for OneMouse on each Mac.

If macOS says OneMouse "cannot be opened because Apple cannot check it for
malicious software", it was installed before this change. Run
`brew reinstall --cask dhirenships/onemouse/onemouse`.

Update with `brew upgrade --cask onemouse`. Remove with
`brew uninstall --cask onemouse`, adding `--zap` to also delete its settings.

Release archives are downloaded from `https://onemouse.app/releases/`.
