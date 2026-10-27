# OneMouse Homebrew tap

[OneMouse](https://onemouse.app/) lets one mouse and keyboard drive several Macs:
move the pointer past a screen edge and keep typing, scrolling, and copying on the
next Mac.

```sh
brew install --cask dhirenships/onemouse/onemouse
```

OneMouse runs on macOS 11 or later, on Apple silicon and Intel Macs. The app is
ad hoc signed and not notarized, so the first launch is blocked: after trying to
open it, choose **System Settings → Privacy & Security → Open Anyway**. Then allow
**Accessibility** and **Input Monitoring** for OneMouse on each Mac.

Update with `brew upgrade --cask onemouse`. Remove with
`brew uninstall --cask onemouse`, adding `--zap` to also delete its settings.

Release archives are downloaded from `https://onemouse.app/releases/`.
