//


#import <UIKit/UIKit.h>


@class OrientationViewController;

@interface OrientationAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	
	OrientationViewController *viewController;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet OrientationViewController *viewController;

@end

