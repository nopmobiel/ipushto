#import <UIKit/UIKit.h>

#import "MyCLController.h"
#import	"MySingleton.h"
#import <CoreMotion/CoreMotion.h>


@interface OrientationViewController : UIViewController 
	<UIAccelerometerDelegate, MyCLControllerDelegate, UITabBarDelegate> {
	MyCLController *locationController;
	CMMotionManager *motionManager;
	NSOperationQueue *opQ;
		
	IBOutlet UITabBar *tabBar;
	IBOutlet UILabel *alt;	
	IBOutlet UILabel *az;	
	IBOutlet UILabel *objalt;	
	IBOutlet UILabel *objaz;	
	IBOutlet UILabel *latLabel;
	IBOutlet UILabel *longLabel;
	IBOutlet UILabel *timeLabel;
	IBOutlet UILabel *radecinfoLabel;
        IBOutlet UILabel *constLabel;

        IBOutlet UILabel *objectIDlabel;
        IBOutlet UILabel *objconstlabel;
IBOutlet UILabel *horizvertlabel;
        IBOutlet UILabel *objectlabel;
        IBOutlet UILabel *objtypeLabel;		    

        IBOutlet UILabel *objsizeLabel;		    
    IBOutlet UILabel *objmagLabel;		    
    IBOutlet UITextView *objnotes;		    
        
	IBOutlet UIImageView *AZdirectionArrow;
	IBOutlet UIImageView *ALTdirectionArrow;
        CLLocation *locatie;
        NSTimer *backgroundTimer;
}


@property (nonatomic, retain) UILabel *alt;
@property (nonatomic, retain) UILabel *az;
@property (nonatomic, retain) UILabel *objalt;
@property (nonatomic, retain) UILabel *objaz;
@property (nonatomic, retain) UILabel *latLabel;
@property (nonatomic, retain) UILabel *longLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *radecinfoLabel;
@property (nonatomic, retain) UILabel *objsizeLabel;
@property (nonatomic, retain) UILabel *objmagLabel;
@property (nonatomic, retain) UILabel *objtypeLabel;
@property (nonatomic, retain) UILabel *objectIDlabel;
@property (nonatomic, retain) UILabel *objconstlabel;
@property (nonatomic, retain) UITextView *objnotes;
@property (nonatomic, retain) UILabel *objectlabel;
@property (nonatomic, retain) UILabel *horizvertlabel;

@property (retain, nonatomic) UIImageView *ALTdirectionArrow;
@property (retain, nonatomic) UIImageView *AZdirectionArrow;
@property (nonatomic,retain) CLLocation *locatie;

-(BOOL)isvertical;
-(void)convertradectoaltaz;


@end
