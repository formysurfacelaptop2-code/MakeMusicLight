#import <UIKit/UIKit.h>

%hook UIWindow

- (void)makeKeyAndVisible {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
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
