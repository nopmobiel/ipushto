
#import "OrientationViewController.h"
#import "MessierZoekFormulierViewController.h"
#import "NGCZoekFormulierViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#include "Math.h"

@implementation OrientationViewController


@synthesize alt;
@synthesize az;
@synthesize objalt;
@synthesize objaz;
@synthesize latLabel;
@synthesize longLabel;
@synthesize timeLabel;
@synthesize radecinfoLabel;
@synthesize objectIDlabel;
@synthesize objconstlabel;
@synthesize objectlabel;
@synthesize objsizeLabel;
@synthesize objmagLabel;
@synthesize horizvertlabel;
@synthesize objnotes;
@synthesize objtypeLabel;
@synthesize ALTdirectionArrow;
@synthesize AZdirectionArrow;
@synthesize locatie;


double ALT, AZ;

NSString *strObjectinfo;

	
- (id) init {
    self = [super init];
    if (self != nil) {
    }
    return self;
	
	
	
}






#pragma mark -
#pragma mark UIAccelerometerDelegate

- (void)accelerometer:(UIAccelerometer *)accelerometer
		didAccelerate:(UIAcceleration *)acceleration {
	

	double y,z;
	
    y = (double)acceleration.y;
    z =(double) acceleration.z;
    y=y*-1;
    if (y>1) y=1;
    if (y<-1) y=-1;
    
    
    // projected on sphere
    y = acos(y) ;
    y = (y / 3.14151927 ) * 180;
    
    //  y=y-180;
    // als z negatief is dan is y dat ook.
 
    
       //   if (z<0)    y=y*-1;
 //   NSLog (@"Z %.2f",z );
    
    // round to 2 digits
    y=  (round(y*100.0)/100.0);
    
    
    if (!isnan(y)) {
        alt.text=@"";
    }
    
    
    if (z<0)    y=y*-1;

    
    if (![self isvertical]) {

         y=y+90;
        
    } else

    
	 
    
    if (isnan(y)) {
        alt.text=@"";
    }
  alt.text = [NSString stringWithFormat:@"%.2f", y];
	
   
	
	
	
	
	double delta = ((ALT-y));
	

	

	if (abs(delta) <= 2 ) {
			ALTdirectionArrow.image = [UIImage imageNamed:@"bullseye.png"]; // target

	
	} else {
		if (delta > 5) ALTdirectionArrow.image = 
							[UIImage imageNamed:@"up_arrow.png"];
						else 
		if (delta < 0) ALTdirectionArrow.image = 
								[UIImage imageNamed:@"down_arrow.png"];
				}
	
		
}
	
	
#pragma mark -

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];

    
    
    
    

    
    
    
	locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	tabBar.delegate = self;
	    motionManager = [[CMMotionManager alloc] init]; 
	
		[locationController.locationManager startUpdatingLocation];
		[locationController.locationManager startUpdatingHeading];
	
	
	
	// Kost wat meer batterij, maar precisie boven alles.
	locationController.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationController.locationManager.headingFilter = kCLHeadingFilterNone;
	
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;

	// Terugzetten naar 0.5 voor productie!
	
	accelerometer.updateInterval = 0.1;
    
    // timer voor update / elke 10 seconden
    backgroundTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self selector: @selector(convertradectoaltaz) userInfo: nil repeats: YES];

}



-(void)viewWillAppear:(BOOL)animated{
	
	strObjectinfo=[MySingleton sharedMySingleton].objectName;
	if (strObjectinfo==NULL) { 	strObjectinfo=@"Please choose.."; 
	
	objalt.text=@"";
    objaz.text=@"";
    }
    
  
    
    
    
    objectIDlabel.text=[MySingleton sharedMySingleton].objectkeuze;
	objectlabel.text=strObjectinfo;
	
    

    [self convertradectoaltaz];

	// Laat zien op scherm
    double ra,dec;
    
    ra=[MySingleton sharedMySingleton].rechteklimming;
    dec=[MySingleton sharedMySingleton].declinatie;
    
    NSString *radecstr = [NSString stringWithFormat:@"RA %.2f DEC %.2f", ra, dec];
    radecinfoLabel.text= radecstr;
	objsizeLabel.text=[MySingleton sharedMySingleton].objectSize;
    objmagLabel.text=[MySingleton sharedMySingleton].objectMagnitude;
    objnotes.text=[MySingleton sharedMySingleton].objectNotes;
	objtypeLabel.text=[MySingleton sharedMySingleton].objectType;
	objconstlabel.text=[MySingleton sharedMySingleton].objectConst;

	
    
}









- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}




- (void) convertradectoaltaz {
    
    NSString *strUren;
	NSString *strMinuten;
	NSString *strJaar;
	NSString *strMaand;
	NSString *strDag;
    
    
	
	double latit, longit, lst, rechteklimming, declinatie, uurhoek, dag, maand, uren, minuten, maanddagen, dagdagen ;
	double dagenj2000, dectijd, tijdut;
	double HARad, DECRad, ALTRad,LatRad, sinALT,  cosAZ,AZ11,AZ12,sinAZ,AZ21,AZ22;
	// initialiseren
    dagdagen=0;
    maanddagen=0;
    
    // intitialiseren waardes
    
    latit=self.locatie.coordinate.latitude;
	longit=self.locatie.coordinate.longitude;

    // singleton data gebruiken.
    
 	rechteklimming=[MySingleton sharedMySingleton].rechteklimming;
	declinatie=[MySingleton sharedMySingleton].declinatie;

	/*
    // DEBUG UITZETTEN!
    // Test voor M13 
    rechteklimming=16.695;
    declinatie=36.46;
    latit=52.5;
    longit=-1.91;
    
    */
    
    
    
    
    
    
    
    
    // We werken in UTC
    
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
	
	
	[formatter setTimeZone:timeZone];
    
	
	// Dag grabben
	[formatter setDateFormat:@"dd"];
	strDag= [formatter stringFromDate:self.locatie.timestamp];
	// NSLog(@"Dag:% @" ,strDag);
	
	// Maand grabben
	[formatter setDateFormat:@"MM"];
	strMaand= [formatter stringFromDate:self.locatie.timestamp];
	// NSLog(@"Maand: %@" ,strMaand);
	
	
	// Uren grabben
	[formatter setDateFormat:@"HH"];
	strUren= [formatter stringFromDate:self.locatie.timestamp];
	// NSLog(@"Uur: %@" ,strUren);
	
	
	// Minuten grabben
	[formatter setDateFormat:@"mm"];
    strMinuten= [formatter stringFromDate:self.locatie.timestamp];
    
	
	// Jaar grabben
	[formatter setDateFormat:@"yyyy"];
	strJaar= [formatter stringFromDate:self.locatie.timestamp];
	
	/*
    // Debug UITZETTEN!!
    strDag=@"10";
    strMaand=@"08";
    strUren=@"23";
    strMinuten=@"10";
    strJaar=@"1998";
    */
    
    
    
	// Converteer string naar float
    
	
	dag = [strDag doubleValue]; 
	maand = [strMaand doubleValue]; 
	uren = [strUren doubleValue]; 
	minuten = [strMinuten doubleValue]; 
    
    // Aantal dagen sinds epoch 2000 berekenen
    
	// Maak van uren+minuten een decimaal
	dectijd =uren + (minuten/60);
	dectijd = dectijd/24;
    
  //  NSLog(@"Dectijd %.2f", dectijd);
	
    
    
    
    
  //  NSLog(@"Latit %.2f, Longit %.2f, RA %.2f,DEC %.2f", latit,longit,rechteklimming,declinatie);
	
	
	
    
	
	
	// in een array plaatsen!
    //	maanddagen= 31; //  Aantal dagen sinds begin van het jaar Augustus in een niet-schrikkeljaar
	
	int intMaand = (int) maand;
	
	
	switch(intMaand)
	{
		case 1 :
			maanddagen =0;
			break;
		case 2 :
			maanddagen =31;
			break;
		case 3 :
			maanddagen =59;
			break;
		case 4 :
			maanddagen =90;
			break;
		case 5 :
			maanddagen =120;
			break;
		case 6 :
			maanddagen =151;
			break;	
		case 7 :
			maanddagen =181;
			break;
		case 8 :
			maanddagen =212;
			break;
		case 9 :
			maanddagen =243;
			break;
		case 10 :
			maanddagen =273;
			break;
		case 11 :
			maanddagen =304;
			break;
		case 12 :
			maanddagen =334;
			break;
			
	}
    
	
	
    
	
    
	
	
	if ([strJaar isEqual:@"2013"]) dagdagen=4747.5;
	if ([strJaar isEqual:@"2014"]) dagdagen=5112.5;
	if ([strJaar isEqual:@"2015"]) dagdagen=5477.5;		
	if ([strJaar isEqual:@"2016"]) {
        // schrikkeljaar!
		
		dagdagen=5842.5;	
		if ([strMaand isEqual:@"01"]) maanddagen=0;
		if ([strMaand isEqual:@"02"]) maanddagen=31;
		if([strMaand isEqual:@"03"]) maanddagen=60;
		if ([strMaand isEqual:@"04"]) maanddagen=91;
		if ([strMaand isEqual:@"05"]) maanddagen=121;
		if ([strMaand isEqual:@"06"]) maanddagen=152;
		if ([strMaand isEqual:@"07"]) maanddagen=182;
		if([strMaand isEqual:@"08"]) maanddagen=213;
		if([strMaand isEqual:@"09"]) maanddagen=244;
		if ([strMaand isEqual:@"10"]) maanddagen=274;
		if ([strMaand isEqual:@"11"]) maanddagen=305;
		if ([strMaand isEqual:@"12"]) maanddagen=335;
		
		
        
	}
	
	
	if ([strJaar isEqual:@"2017"]) dagdagen=6208.5;
	if ([strJaar isEqual:@"2018"]) dagdagen=6573.5;
    
	
	
	
	
	// optellen en aantal dagen bepalen sinds 01-01-2000 0:00
    
	dagenj2000=dectijd+maanddagen+dag+dagdagen;
	
//    NSLog(@"Dagen J2000 %.2f = dectijd %.2f + maanddagen %.2f + dag %.2f + dagdagen %.2f", dagenj2000, dectijd, maanddagen,dag,dagdagen);
    
    
	// Local Siderial Time
    
	
	// UT tijd berekenen
	tijdut =uren + (minuten/60);
    
	lst = 100.46 + 0.985647 * dagenj2000 + longit + 15*tijdut ;
	
	// modulusberekening. Cocoa doet alleen INT op modulus 
	lst = lst - (floor(lst/ 360) *360);  
	
    
    // Rechteklimming converteren van decimalen naar graden
    rechteklimming  = rechteklimming * 15;
	
    // Uurhoek berekenen. Als uurhoek <0 360 erbij optellen.
	
	
	uurhoek	= lst - rechteklimming;
	if (uurhoek<0){
		uurhoek=uurhoek+360;
	}
	
    
	
 //   NSLog(@"Uurhoek %.2f rechteklimming %.2f" ,uurhoek,rechteklimming);
    
    
	
    // CONVERSIE RA/DEC --> ALTAZ
	
	// Converteer graden naar radians;
	
	HARad= (uurhoek*M_PI)/180;
	DECRad = (declinatie*M_PI)/180;
	LatRad = (latit*M_PI)/180;
	
	sinALT = sin(DECRad) * sin(LatRad) + cos(DECRad)* cos(LatRad)* cos(HARad);
	ALTRad = asin(sinALT) ;
	ALT = ALTRad * 180/M_PI;
	cosAZ = (sin(DECRad)* cos(LatRad)- cos(DECRad)*cos(HARad)* sin(LatRad))/ cos(ALTRad) ;
	AZ11 = (acos(cosAZ)) * 180/M_PI ;	
	AZ12 = 360 - AZ11 ;		
	sinAZ = (-cos(DECRad)*sin(HARad))/cos(ALTRad);
	AZ21 = (asin(sinAZ))  * 180/M_PI  ;
	if (AZ21 >=0 ) {AZ22  = 180 - AZ21 ;} else { AZ22 = 360 - AZ21 ; } ;
	if ((abs(AZ11-AZ21) <= 0.0001)||(abs(AZ11-AZ22) <= 0.0001)){
		AZ = AZ11 ;
	}else {AZ = AZ12 ;}
	
    
	
	
    // SCHERMOUTPUT
    
	
    strObjectinfo=[MySingleton sharedMySingleton].objectkeuze;
    objalt.text = [NSString stringWithFormat:@"%.2f", ALT];
	objaz.text = [NSString stringWithFormat:@"%.2f", AZ];
       
	if (strObjectinfo==NULL) { 		
        objalt.text = @"";//[NSString stringWithFormat:@"%.2f", ALT];
        objaz.text =@"";// [NSString stringWithFormat:@"%.2f", AZ];
    }
	// Laat lat en Lon zien op scherm
	latLabel.text = [NSString stringWithFormat:@"Lat: %.2f", self.locatie.coordinate.latitude];
	longLabel.text = [NSString stringWithFormat:@"Lon: %.2f", self.locatie.coordinate.longitude];
	
	// TijdLabel op scherm  (terugconverteren naar GMT+1) --> Was een BUG! 
	
	timeZone = [NSTimeZone systemTimeZone];
	[formatter setTimeZone:timeZone];
    
	[formatter setDateFormat:@"HH:mm"];
	
	strUren= [formatter stringFromDate:self.locatie.timestamp];
	timeLabel.text= strUren;
    

    
    if (ALT<0) { 	strObjectinfo=@"Object under horizon";
        
        objalt.text=@"Under";
        objaz.text=@"Horizon";
    }
	

}

- (void)locationUpdate:(CLLocation *)location {
    self.locatie = location;
    
    
	}


- (void)headingUpdate:(CLHeading *)heading {
	

	
	// If the accuracy is valid, process the event.
	
	if (heading.headingAccuracy > 0)
		
	{
		
		az.text = [NSString stringWithFormat:@"%.2f", heading.trueHeading];
		
		

		 double delta = heading.trueHeading - AZ;
		 if (abs(delta) <= 10) {
		 AZdirectionArrow.image = [UIImage imageNamed:@"bullseye.png"]; // target
		 } else {
		 if (delta > 180) AZdirectionArrow.image = 
		 [UIImage imageNamed:@"right_arrow.png"];
		 else if (delta > 0) AZdirectionArrow.image = 
		 [UIImage imageNamed:@"left_arrow.png"];
		 else if (delta > -180) AZdirectionArrow.image = 
		 [UIImage imageNamed:@"right_arrow.png"];
		 else AZdirectionArrow.image = [UIImage imageNamed:@"left_arrow.png"];
		 }
		 AZdirectionArrow.hidden = NO;
		 } else {
		 AZdirectionArrow.hidden = YES;
		 

		
	}
	

	
	
	
	
	

	
}

-(BOOL) isvertical {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL vertical = [defaults boolForKey:@"vertical"];
    if (vertical) {
        return TRUE;
    }
    else
        return FALSE;
    
}


- (void)locationError:(NSError *)error {
    latLabel.text = [error description];
}




- (IBAction)infoButtonClick:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The Orientation window" 
                                                    message:@"Based on your selection, the Altitude and Azimuth are calculated for the object. Now you can point your telescope to the object. The numbers in the telescope position panel and the object panel should match. The arrows are here to help you. Hint: start with horizontal axis (like a compass) alignment, after that align vertically."
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    [alert show];
    
}






@end
