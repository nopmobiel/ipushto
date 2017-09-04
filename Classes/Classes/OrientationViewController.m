
#import "OrientationViewController.h"
#import "ZoekFormulierViewController.h"

@implementation OrientationViewController


@synthesize alt;
@synthesize az;
@synthesize objalt;
@synthesize objaz;
@synthesize latLabel;
@synthesize longLabel;
@synthesize timeLabel;
@synthesize radecinfoLabel;
@synthesize objectlabel;
@synthesize objinfoLabel;



	
	
	





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
	
		
	UIAccelerationValue x, y, z;

	x = acceleration.x;
	y = acceleration.y;
	z = acceleration.z;

	float degrees = ((z * 90) +90);
	

   // De altitude laten zien op scherm
	
	alt.text = [NSString stringWithFormat:@"%.2f", degrees];


	
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
	

	locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	tabBar.delegate = self;
	


	
	
	
	[locationController.locationManager startUpdatingLocation];
	[locationController.locationManager startUpdatingHeading];
	
	// Kost wat meer batterij, maar precisie boven alles.
	locationController.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationController.locationManager.headingFilter = kCLHeadingFilterNone;
	
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;

	// Terugzetten naar 0.5 voor productie!
	
	accelerometer.updateInterval = 0.5; // twice per second
	

	

	
	
	
	[super viewDidLoad];
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


- (void)locationUpdate:(CLLocation *)location {

	NSString *strUren;
	NSString *strMinuten;
	NSString *strJaar;
	NSString *strMaand;
	NSString *strDag;
	NSString *strObjectinfo;
	
	
	double latit, longit, lst, rechteklimming, declinatie, uurhoek, dag, maand, uren, minuten,jaar, maanddagen, dagdagen ;
	double rechteklimminguur, rechteklimmingminuut, declinatieuur, declinatieminuut, dagenj2000, dectijd, tijdut;
	double HARad, DECRad, ALTRad,AZ,LatRad, sinALT, ALT, cosAZ,AZ11,AZ12,sinAZ,AZ21,AZ22;
	
	
	

	


	
// We gebruiken een singleton object (globale variabele om de objectkeuze van de andere tab door te geven)
	
	
	strObjectinfo=[MySingleton sharedMySingleton].objectkeuze;
	
	
	[MySingleton sharedMySingleton].haalObjectGegevensOp;
	
	
	rechteklimminguur=[MySingleton sharedMySingleton].rechteklimminguur;
	rechteklimmingminuut=[MySingleton sharedMySingleton].rechteklimmingminuut;
	declinatieuur=[MySingleton sharedMySingleton].declinatieuur;
	declinatieminuut=[MySingleton sharedMySingleton].declinatieminuut;
	
	
	
// Laat zien op scherm
	
	NSString *radecinfo = [NSString stringWithFormat:@"RA %.0f h, %.0f min, DEC %.0f h, %.0f min",rechteklimminguur,rechteklimmingminuut, declinatieuur, declinatieminuut];
	
	radecinfoLabel.text = 	radecinfo;
	
		
	
	
	
	if (strObjectinfo==NULL) 	strObjectinfo=@"Please Choose"; 
	
	objectlabel.text=strObjectinfo;
	
	

	
// conversie naar decimalen
	
	rechteklimming= rechteklimminguur + (rechteklimmingminuut/60) ;
	rechteklimming = rechteklimming *15;
	declinatie= declinatieuur + (declinatieminuut/60);
	
//	NSLog(@"rechteklimming %f", rechteklimming);
//	NSLog(@"declinatie object %f", declinatie);
	

// opslaan huidige locatie voor berekenening
	
	latit = location.coordinate.latitude;
	longit=  location.coordinate.longitude;
	
	
// We werken in UTC

	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
	[formatter setTimeZone:timeZone];

	
	// Dag grabben
	[formatter setDateFormat:@"dd"];
	strDag= [formatter stringFromDate:location.timestamp];

	// Maand grabben
	[formatter setDateFormat:@"mm"];
	strMaand= [formatter stringFromDate:location.timestamp];
	
	
	// Uren grabben
	[formatter setDateFormat:@"HH"];
	strUren= [formatter stringFromDate:location.timestamp];

	// Minuten grabben
	[formatter setDateFormat:@"mm"];
	strMinuten= [formatter stringFromDate:location.timestamp];

	// Jaar grabben
	[formatter setDateFormat:@"yyyy"];
	strJaar= [formatter stringFromDate:location.timestamp];
	
	
	// Converteer string naar float

	
	dag = [strDag floatValue]; 
	maand = [strMaand floatValue]; 
	uren = [strUren floatValue]; 
	minuten = [strMinuten floatValue]; 
	jaar = [strJaar floatValue]; 

	

	
	 
// Aantal dagen sinds epoch 2000 berekenen

	// Maak van uren+minuten een decimaal
	dectijd =uren + (minuten/60);
	dectijd = dectijd/24;


	// vervang deze harde waarden door een array of database!!!
	
	
	/*
	 Table A                |  Table B
	 Days to beginning of   |  Days since J2000 to
	 month                  |  beginning of each year
	 |
	 Month   Normal   Leap  |  Year   Days    |  Year   Days
	 year     year  |                 |
	 |                 |
	 Jan       0        0   |  1998   -731.5  |   2010  3651.5
	 Feb      31       31   |  1999   -366.5  |   2011  4016.5
	 Mar      59       60   |  2000     -1.5  |   2012  4381.5
	 Apr      90       91   |  2001    364.5  |   2013  4747.5
	 May     120      121   |  2002    729.5  |   2014  5112.5    
	 Jun     151      152   |  2003   1094.5  |   2015  5477.5
	 Jul     181      182   |  2004   1459.5  |   2016  5842.5
	 Aug     212      213   |  2005   1825.5  |   2017  6208.5
	 Sep     243      244   |  2006   2190.5  |   2018  6573.5
	 Oct     273      274   |  2007   2555.5  |   2019  6938.5
	 Nov     304      305   |  2008   2920.5  |   2020  7303.5

	 */
	
	
	
	
	
	// in een array plaatsen!
	maanddagen= 31; //  Aantal dagen sinds begin van het jaar Augustus in een niet-schrikkeljaar
	
	
NSLog(@"log: %@ ", strJaar);
	
	if (strJaar==@"2011") dagdagen=4016.5;
	if (strJaar==@"2012") dagdagen=4016.5;
	if (strJaar==@"2013") dagdagen=4016.5;
	if (strJaar==@"2014") dagdagen=4016.5;
	if (strJaar==@"2015") dagdagen=4016.5;		
	if (strJaar==@"2016") dagdagen=4016.5;		
	if (strJaar==@"2017") dagdagen=4016.5;		
	if (strJaar==@"2018") dagdagen=4016.5;		
	
	
	
	dagdagen=4016.5; // Aantal dagen sinds 01-01-2000 tot begin van het jaar
	
	
	
	
	
	
	// optellen en aantal dagen bepalen sinds 01-01-2000 0:00

	dagenj2000=dectijd+maanddagen+dag+dagdagen;
	
//	NSLog(@"dagen sinds 2000 %f", dagenj2000);
	

	// Local Siderial Time

	
	// UT tijd berekenen
	tijdut =uren + (minuten/60);

	lst = 100.46 + 0.985647 * dagenj2000 + longit + 15*tijdut ;
	
	// modulusberekening. Cocoa doet alleen INT op modulus 
	lst = lst - (floor(lst/ 360) *360);  
	
	

//	NSLog(@"tijdUT %f", tijdut);
//	NSLog(@"long %f", longit);
//	NSLog(@"lst %f", lst);
	
	
	
// Uurhoek berekenen. Als uurhoek <0 360 erbij optellen.
	
	
	uurhoek	= lst - rechteklimming;
	if (uurhoek<0){
		uurhoek=uurhoek+360;
	}
	

	
//	NSLog(@"Uurhoek %f", uurhoek);

	
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
	
//	NSLog(@"objaz %f", AZ);
//	NSLog(@"objalt %f", ALT);
	
	
// SCHERMOUTPUT

	
	// Object Alt/az laten zien (berekend uit RADEC);

	objalt.text = [NSString stringWithFormat:@"%.2f", ALT];
	objaz.text = [NSString stringWithFormat:@"%.2f", AZ];


	// Laat lat en Lon zien op scherm
	latLabel.text = [NSString stringWithFormat:@"Lat: %l.2f", location.coordinate.latitude];
	longLabel.text = [NSString stringWithFormat:@"Lon: %l.2f", location.coordinate.longitude];
	
	// TijdLabel op scherm  (terugconverteren naar GMT+1)
	
	timeZone = [NSTimeZone timeZoneWithName:@"GMT+1"];
	[formatter setTimeZone:timeZone];

	[formatter setDateFormat:@"HH:mm"];
	strUren= [formatter stringFromDate:location.timestamp];
	timeLabel.text= strUren;

	// releases 
	formatter.release;
}

- (void)headingUpdate:(CLHeading *)heading {
	

	

	// If the accuracy is valid, process the event.
	
	if (heading.headingAccuracy > 0)
		
	{
		
		az.text = [NSString stringWithFormat:@"%.2f", heading.trueHeading];
		
		
		// Do something with the event data.
		
	}
	
	

	
}



- (void)locationError:(NSError *)error {
    latLabel.text = [error description];
}









- (void)dealloc {
    [locationController release];
	[tabBar release];
    [super dealloc];
}

@end
