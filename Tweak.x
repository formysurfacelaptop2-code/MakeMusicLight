#import <UIKit/UIKit.h>

#pragma mark - 1. UIKit Window/VC forcing

%hook UIWindow

- (void)makeKeyAndVisible {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)style {
    %orig(UIUserInterfaceStyleLight);
}

%end


%hook UIViewController

- (void)viewDidLoad {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

%end


#pragma mark - 2. Trait collection override (important for iOS 15+ / 17)

%hook UITraitCollection

- (UIUserInterfaceStyle)userInterfaceStyle {
    return UIUserInterfaceStyleLight;
}

%end


#pragma mark - 3. UIApplication-level enforcement

%hook UIApplication

- (UIInterfaceStyle)userInterfaceStyle {
    return UIUserInterfaceStyleLight;
}

- (void)setDelegate:(id)delegate {
    %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        for (UIWindow *window in UIApplication.sharedApplication.windows) {
            window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
    });
}

%end
