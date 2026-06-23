%hook UIViewController

- (void)viewDidLoad {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

%end


%hook UIWindow

- (void)makeKeyAndVisible {
    %orig;
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

%end
