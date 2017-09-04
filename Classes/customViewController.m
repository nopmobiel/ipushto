//
//  customViewController.m
//  iPushTo
//
//  Created by Norbert Schmidt on 02-03-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import "customViewController.h"
#import "MySingleton.h"
@implementation customViewController

@synthesize hideKeyboardButton;
@synthesize submitButton;
@synthesize txtRAuur;
@synthesize txtRAminuut;
@synthesize segPlusmin;
@synthesize txtDECuur;
@synthesize txtDECminuut;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [submitButton useBlackStyle];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (IBAction)hidekeyboard:(id)sender {
    [[self txtRAuur] resignFirstResponder];
    [[self txtRAminuut] resignFirstResponder];
    [[self txtDECuur] resignFirstResponder];
    [[self txtDECminuut] resignFirstResponder];
}


- (IBAction)submitclick {
    if( [self textfieldcheck]) {
        self.tabBarController.selectedIndex = 0;
    }
    
}




-(BOOL)textfieldcheck {
    NSArray *fieldArray;
    int i = 0;
    
    // Load up our field array with the UITextField Values
    fieldArray = [NSArray arrayWithObjects:
                  [NSString stringWithFormat:@"%@",txtDECuur.text],
                  [NSString stringWithFormat:@"%@",txtDECminuut.text],
                  [NSString stringWithFormat:@"%@",txtRAuur.text],
                  [NSString stringWithFormat:@"%@",txtRAminuut.text],nil] ;
    
    // loop through the array, alert if text field is empty, and break the the loop, other wise increment i  
    for (NSString *fieldText in fieldArray){
        if([fieldText isEqualToString:@""]){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Fill in All Required Fields." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            break;
        }
        
        i++;
    }
    // Test voor M13 
    // RA  = 16 h 41.7 min
//    DEC = 36 d 28   min

//    rechteklimming=16.695;
 //   declinatie=36.46;

    
    
    // check that all the field were passed (i == array.count) if so execute
    if(i == [[NSNumber numberWithInt: fieldArray.count] intValue]){
        
        double RAuur=[txtRAuur.text doubleValue];
        double RAminuut=[txtRAminuut.text doubleValue];
        double DECuur=[txtDECuur.text doubleValue];
        double DECminuut=[txtDECminuut.text doubleValue];
        
        NSString *RAString = [NSString stringWithFormat:@"%@.%@",txtRAuur.text,txtRAminuut.text ]; 
        NSString *DECstring = [NSString stringWithFormat:@"%@.%@",txtDECuur.text,txtDECminuut.text ]; 
        

        
        double rechteklimming = (RAuur ) + (RAminuut /60) ;
        double declinatie=DECuur + (DECminuut / 60) ;
        if (self.segPlusmin.selectedSegmentIndex==1){ declinatie=declinatie*-1;};

      //  NSLog(@"Rechteklimming %.2f Declinatie %.2f" , rechteklimming, declinatie);
        
        [MySingleton sharedMySingleton].declinatie= declinatie;
        [MySingleton sharedMySingleton].rechteklimming=rechteklimming;
        [MySingleton sharedMySingleton].objectkeuze=[NSString stringWithFormat:@"RA:%@ DEC:%@", RAString, DECstring];
        return true;
        
        
        
    }
    return FALSE;

}


- (IBAction)infoButtonClick:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The Custom coordinates window" 
                                                    message:@"Enter the right ascention and declination coordinates in Hours and Minutes here. Use N (North) for positive declination and S(South) for negative declination. Hit submit when done. "
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    [alert show];
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
