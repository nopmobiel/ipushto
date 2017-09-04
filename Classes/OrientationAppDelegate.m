#import "OrientationAppDelegate.h"
#import "OrientationViewController.h"
#import "MessierZoekformulierViewController.h"
#import "NGCZoekformulierViewController.h"



@implementation OrientationAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
 
    // Override point for customization after app launch    
   [window addSubview:viewController.view];
	[window addSubview:tabBarController.view];
	[window makeKeyAndVisible];
    self.window.rootViewController = self.tabBarController;


	[[UIApplication sharedApplication] setStatusBarHidden:YES ];


}




@end
