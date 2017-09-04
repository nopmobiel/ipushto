#import "OrientationAppDelegate.h"
#import "OrientationViewController.h"
#import "ZoekformulierViewController.h"



@implementation OrientationAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
 
    // Override point for customization after app launch    
   [window addSubview:viewController.view];
	[window addSubview:tabBarController.view];
	
	
	
	[window makeKeyAndVisible];



	
	






}


- (void)dealloc {
	[tabBarController release];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
