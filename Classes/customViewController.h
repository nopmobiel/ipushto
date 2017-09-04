//
//  customViewController.h
//  iPushTo
//
//  Created by Norbert Schmidt on 02-03-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientButton.h"
@interface customViewController : UIViewController {
    
    IBOutlet UIButton *hideKeyboardButton;
    IBOutlet GradientButton *submitButton;
    IBOutlet UITextField *txtRAuur;
    IBOutlet UITextField *txtRAminuut;
    IBOutlet UISegmentedControl *segPlusmin;
    IBOutlet UITextField *txtDECuur;
    IBOutlet UITextField *txtDECminuut;
    
}

@property (nonatomic,retain) IBOutlet UIButton *hideKeyboardButton;
@property (nonatomic,retain) IBOutlet GradientButton *submitButton;
@property (nonatomic,retain) IBOutlet UITextField *txtRAuur;
@property (nonatomic,retain) IBOutlet UITextField *txtRAminuut;
@property (nonatomic,retain) IBOutlet UISegmentedControl *segPlusmin;
@property (nonatomic,retain) IBOutlet UITextField *txtDECuur;
@property (nonatomic,retain) IBOutlet UITextField *txtDECminuut;



- (IBAction)hidekeyboard:(id)sender;
-(IBAction)submitclick;
-(BOOL) textfieldcheck;
  


@end
