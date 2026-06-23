# MakeMusicLight

A tiny jailbreak tweak that forces the Apple Music app into Light Mode,
independent of your device's system-wide appearance setting. Nothing
else is changed — no other colors, no other screens, no settings UI.

## How it works

One hook, public API only:

```objc
%hook UIWindow
- (void)makeKeyAndVisible {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}
%end
```

`overrideUserInterfaceStyle` has been a stable, documented UIKit
property since iOS 13. Because it cascades down through the whole
view hierarchy — UIKit or SwiftUI-hosted — this works regardless of
how Apple has internally implemented any given screen, and isn't
expected to break across Music app redesigns the way hooks into
private/internal classes would.

The tweak is scoped to `com.apple.Music` only via `MakeMusicLight.plist`
and never loads into any other app.

## Compatibility

Built against `iphone:clang:latest:15.0`, matching the deployment
floor of WhatAMess, for the same rootless-jailbreak compatibility
range. Requires `mobilesubstrate`.

## Building

Requires [Theos](https://theos.dev):

```
make package FINALPACKAGE=1
```

or, with a device configured over SSH:

```
make package install
```

## Installing

Transfer the resulting `.deb` from `packages/` to your device (AirDrop,
Filza, or `make install` as above) and install it, e.g.:

```
dpkg -i com.yourname.makemusiclight_0.1_iphoneos-arm.deb
```

Then respring or relaunch Apple Music.

## Notes

- This is always-on — there's no Settings toggle to disable it. If you
  want one added later, that's a separate, optional change.
- `overrideUserInterfaceStyle` is set on `makeKeyAndVisible`, which
  fires at launch. If Music is already open when you install/respring,
  fully close and reopen it once.
