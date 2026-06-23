#import <UIKit/UIKit.h>

// Forces every window in Apple Music to Light Mode, regardless of the
// system-wide appearance setting. Public API only (overrideUserInterfaceStyle,
// stable since iOS 13) — no private classes, nothing to break when Apple
// redesigns Music's UI.

%hook UIWindow

- (void)makeKeyAndVisible {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

%end
