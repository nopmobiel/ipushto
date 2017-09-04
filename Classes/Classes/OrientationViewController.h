#import <UIKit/UIKit.h>
#import "MyCLController.h"
#import	"MySingleton.h"



@interface OrientationViewController : UIViewController 
	<UIAccelerometerDelegate, MyCLControllerDelegate, UITabBarDelegate> {
	MyCLController *locationController;
	IBOutlet UITabBar *tabBar;
	IBOutlet UILabel *alt;	
	IBOutlet UILabel *az;	
	IBOutlet UILabel *objalt;	
	IBOutlet UILabel *objaz;	
	IBOutlet UILabel *latLabel;
	IBOutlet UILabel *longLabel;
	IBOutlet UILabel *timeLabel;
	IBOutlet UILabel *radecinfoLabel;
	IBOutlet UILabel *objectlabel;
	IBOutlet UILabel *objinfoLabel;		    

	
		
}


@property (nonatomic, retain) UILabel *alt;
@property (nonatomic, retain) UILabel *az;
@property (nonatomic, retain) UILabel *objalt;
@property (nonatomic, retain) UILabel *objaz;
@property (nonatomic, retain) UILabel *latLabel;
@property (nonatomic, retain) UILabel *longLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *radecinfoLabel;
@property (nonatomic, retain) UILabel *objinfoLabel;
@property (nonatomic, retain) UILabel *objectlabel;


@end
