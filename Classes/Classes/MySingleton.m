//
//  MySingleton.m
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import "MySingleton.h"


@implementation MySingleton


@synthesize objectkeuze; 
@synthesize rechteklimminguur;
@synthesize rechteklimmingminuut;
@synthesize declinatieuur;
@synthesize declinatieminuut;




	
static MySingleton* _sharedMySingleton = nil;

+(MySingleton*)sharedMySingleton
{
	@synchronized([MySingleton class])
	{
		if (!_sharedMySingleton)
			[[self alloc] init];
		
		return _sharedMySingleton;
	}
	
	return nil;
}

+(id)alloc
{
	@synchronized([MySingleton class])
	{
		NSAssert(_sharedMySingleton == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedMySingleton = [super alloc];
		return _sharedMySingleton;
	}
	
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
	}
	
	return self;
}

-(void)haalObjectGegevensOp {
	NSString *objectnaam;

	objectnaam=self.objectkeuze;
	
	
	
	
	if ( objectnaam	== @"M1") {
		
		rechteklimminguur=5;
		rechteklimmingminuut=34.5;
		declinatieuur=22;
		declinatieminuut=1;
	}
	
	
	if ( objectnaam	== @"M2") {
		
		rechteklimminguur=21;
		rechteklimmingminuut=33.5;
		declinatieuur=-0.0000001;
		declinatieminuut=49;
	}
	
	
	if ( objectnaam	== @"M3") {
		
		rechteklimminguur=13;
		rechteklimmingminuut=42.2;
		declinatieuur=28;
		declinatieminuut=23;
	}
	
	
	if ( objectnaam	== @"M4") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=23.6;
		declinatieuur=-26;
		declinatieminuut=32;
	}
	
	if ( objectnaam	== @"M5") {
		
		rechteklimminguur=15;
		rechteklimmingminuut=18.6;
		declinatieuur=2;
		declinatieminuut=5;
	}
	
	if ( objectnaam	== @"M6") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=40.1;
		declinatieuur=-32;
		declinatieminuut=13;
	}
	
	if ( objectnaam	== @"M7") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=53.9;
		declinatieuur=-34;
		declinatieminuut=49;
	}
	
	if ( objectnaam	== @"M8") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=3.8;
		declinatieuur=-24;
		declinatieminuut=23;
	}
	
	if ( objectnaam	== @"M9") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=19.2;
		declinatieuur=-18;
		declinatieminuut=31;
	}
	
	if ( objectnaam	== @"M10") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=57.1;
		declinatieuur=-4;
		declinatieminuut=6;
	}
	
	
	
	// 11-20
	
	
	if ( objectnaam	== @"M11") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=51.1;
		declinatieuur=-6;
		declinatieminuut=16;
	}
	
	
	if ( objectnaam	== @"M12") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=47.2;
		declinatieuur=-1;
		declinatieminuut=57;
	}
	
	
	if ( objectnaam	== @"M13") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=41.7;
		declinatieuur=36;
		declinatieminuut=28;
	}
	
	
	if ( objectnaam	== @"M14") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=37.6;
		declinatieuur=-3;
		declinatieminuut=15;
	}
	
	if ( objectnaam	== @"M15") {
		
		rechteklimminguur=21;
		rechteklimmingminuut=30;
		declinatieuur=12;
		declinatieminuut=10;
	}
	
	if ( objectnaam	== @"M16") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=18.8;
		declinatieuur=-13;
		declinatieminuut=47;
	}
	
	if ( objectnaam	== @"M17") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=20.8;
		declinatieuur=-16;
		declinatieminuut=11;
	}
	
	if ( objectnaam	== @"M18") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=19.9;
		declinatieuur=-17;
		declinatieminuut=8;
	}
	
	if ( objectnaam	== @"M19") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=2.6;
		declinatieuur=-26;
		declinatieminuut=16;
	}
	
	if ( objectnaam	== @"M20") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=2.6;
		declinatieuur=-23;
		declinatieminuut=2;
	}
	
	
	// 21-30


	
	if ( objectnaam	== @"M21") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=4.6;
		declinatieuur=-22;
		declinatieminuut=30;
	}
	
	
	if ( objectnaam	== @"M22") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=36.4;
		declinatieuur=-23;
		declinatieminuut=54;
	}
	
	
	if ( objectnaam	== @"M23") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=56.8;
		declinatieuur=-19;
		declinatieminuut=1;
	}
	
	
	if ( objectnaam	== @"M24") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=16.9;
		declinatieuur=-18;
		declinatieminuut=29;
	}
	
	if ( objectnaam	== @"M25") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=31.6;
		declinatieuur=-19;
		declinatieminuut=15;
	}
	
	if ( objectnaam	== @"M26") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=45.2;
		declinatieuur=-9;
		declinatieminuut=24;
	}
	
	if ( objectnaam	== @"M27") {
		
		rechteklimminguur=19;
		rechteklimmingminuut=59.6;
		declinatieuur=22;
		declinatieminuut=43;
	}
	
	if ( objectnaam	== @"M28") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=24.5;
		declinatieuur=-24;
		declinatieminuut=52;
	}
	
	if ( objectnaam	== @"M29") {
		
		rechteklimminguur=20;
		rechteklimmingminuut=23.9;
		declinatieuur=38;
		declinatieminuut=32;
	}
	
	if ( objectnaam	== @"M30") {
		
		rechteklimminguur=21;
		rechteklimmingminuut=40.4;
		declinatieuur=-23;
		declinatieminuut=11;
	}
	
	
// 30- 40
	
	
	
	
	if ( objectnaam	== @"M31") {
		
		rechteklimminguur=0;
		rechteklimmingminuut=42.7;
		declinatieuur=41;
		declinatieminuut=16;
	}
	
	
	if ( objectnaam	== @"M32") {
		
		rechteklimminguur=00;
		rechteklimmingminuut=42.7;
		declinatieuur=40;
		declinatieminuut=52;
	}
	
	
	if ( objectnaam	== @"M33") {
		
		rechteklimminguur=01;
		rechteklimmingminuut=33.9;
		declinatieuur=30;
		declinatieminuut=39;
	}
	
	
	if ( objectnaam	== @"M34") {
		
		rechteklimminguur=2;
		rechteklimmingminuut=42.0;
		declinatieuur=42;
		declinatieminuut=47;
	}
	
	if ( objectnaam	== @"M35") {
		
		rechteklimminguur=6;
		rechteklimmingminuut=8.9;
		declinatieuur=24;
		declinatieminuut=20;
	}
	
	if ( objectnaam	== @"M36") {
		
		rechteklimminguur=05;
		rechteklimmingminuut=36.1;
		declinatieuur=34;
		declinatieminuut=8;
	}
	
	if ( objectnaam	== @"M37") {
		
		rechteklimminguur=05;
		rechteklimmingminuut=52.4;
		declinatieuur=32;
		declinatieminuut=33;
	}
	
	if ( objectnaam	== @"M38") {
		
		rechteklimminguur=05;
		rechteklimmingminuut=28.4;
		declinatieuur=35;
		declinatieminuut=50;
	}
	
	if ( objectnaam	== @"M39") {
		
		rechteklimminguur=21;
		rechteklimmingminuut=32.2;
		declinatieuur=48;
		declinatieminuut=26;
	}
	
	if ( objectnaam	== @"M40") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=22.4;
		declinatieuur=58;
		declinatieminuut=5;
	}
	
	// 40-50
	
	
	
	
	if ( objectnaam	== @"M41") {
		
		rechteklimminguur=6;
		rechteklimmingminuut=46;
		declinatieuur=-20;
		declinatieminuut=44;
	}
	
	
	if ( objectnaam	== @"M42") {
		
		rechteklimminguur=5;
		rechteklimmingminuut=35.4;
		declinatieuur=-5;
		declinatieminuut=27;
	}
	
	
	if ( objectnaam	== @"M43") {
		
		rechteklimminguur=5;
		rechteklimmingminuut=35.6;
		declinatieuur=-5;
		declinatieminuut=16;
	}
	
	
	if ( objectnaam	== @"M44") {
		
		rechteklimminguur=8;
		rechteklimmingminuut=40.1;
		declinatieuur=19;
		declinatieminuut=59;
	}
	
	if ( objectnaam	== @"M45") {
		
		rechteklimminguur=3;
		rechteklimmingminuut=47;
		declinatieuur=24;
		declinatieminuut=7;
	}
	
	if ( objectnaam	== @"M46") {
		
		rechteklimminguur=7;
		rechteklimmingminuut=41.8;
		declinatieuur=-14;
		declinatieminuut=49;
	}
	
	if ( objectnaam	== @"M47") {
		
		rechteklimminguur=7;
		rechteklimmingminuut=36.6;
		declinatieuur=-14;
		declinatieminuut=30;
	}
	
	if ( objectnaam	== @"M48") {
		
		rechteklimminguur=8;
		rechteklimmingminuut=13.8;
		declinatieuur=-5;
		declinatieminuut=48;
	}
	
	if ( objectnaam	== @"M49") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=29.8;
		declinatieuur=8;
		declinatieminuut=0;
	}
	
	if ( objectnaam	== @"M50") {
		
		rechteklimminguur=7;
		rechteklimmingminuut=3.2;
		declinatieuur=-8;
		declinatieminuut=20;
	}
	
	
	
	
	// 50-60 
	
	
	
	
	if ( objectnaam	== @"M51") {
		
		rechteklimminguur=13;
		rechteklimmingminuut=29.9;
		declinatieuur=47;
		declinatieminuut=12;
	}
	
	
	if ( objectnaam	== @"M52") {
		
		rechteklimminguur=23;
		rechteklimmingminuut=24.2;
		declinatieuur=61;
		declinatieminuut=35;
	}
	
	
	if ( objectnaam	== @"M53") {
		
		rechteklimminguur=13;
		rechteklimmingminuut=12.9;
		declinatieuur=18;
		declinatieminuut=10;
	}
	
	
	if ( objectnaam	== @"M54") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=55.1;
		declinatieuur=-30;
		declinatieminuut=29;
	}
	
	if ( objectnaam	== @"M55") {
		
		rechteklimminguur=19;
		rechteklimmingminuut=40;
		declinatieuur=-30;
		declinatieminuut=58;
	}
	
	if ( objectnaam	== @"M56") {
		
		rechteklimminguur=19;
		rechteklimmingminuut=16.6;
		declinatieuur=30;
		declinatieminuut=11;
	}
	
	if ( objectnaam	== @"M57") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=53.6;
		declinatieuur=33;
		declinatieminuut=02;
	}
	
	if ( objectnaam	== @"M58") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=37.7;
		declinatieuur=11;
		declinatieminuut=49;
	}
	
	if ( objectnaam	== @"M59") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=42;
		declinatieuur=11;
		declinatieminuut=39;
	}
	
	if ( objectnaam	== @"M60") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=34.7;
		declinatieuur=11;
		declinatieminuut=33;
	}
	
	
	// 60-70
	
	
	
	
	if ( objectnaam	== @"M61") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=21.9;
		declinatieuur=4;
		declinatieminuut=28;
	}
	
	
	if ( objectnaam	== @"M62") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=1.2;
		declinatieuur=30;
		declinatieminuut=7;
	}
	
	
	if ( objectnaam	== @"M63") {
		
		rechteklimminguur=13;
		rechteklimmingminuut=15.8;
		declinatieuur=42;
		declinatieminuut=2;
	}
	
	
	if ( objectnaam	== @"M64") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=56.7;
		declinatieuur=21;
		declinatieminuut=41;
	}
	
	if ( objectnaam	== @"M65") {
		
		rechteklimminguur=11;
		rechteklimmingminuut=18.9;
		declinatieuur=13;
		declinatieminuut=5;
	}
	
	if ( objectnaam	== @"M66") {
		
		rechteklimminguur=11;
		rechteklimmingminuut=20.2;
		declinatieuur=12;
		declinatieminuut=59;
	}
	
	if ( objectnaam	== @"M67") {
		
		rechteklimminguur=8;
		rechteklimmingminuut=50.4;
		declinatieuur=11;
		declinatieminuut=49;
	}
	
	if ( objectnaam	== @"M68") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=39.5;
		declinatieuur=-26;
		declinatieminuut=45;
	}
	
	if ( objectnaam	== @"M69") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=31.4;
		declinatieuur=-32;
		declinatieminuut=21;
	}
	
	if ( objectnaam	== @"M70") {
		
		rechteklimminguur=18;
		rechteklimmingminuut=43.2;
		declinatieuur=-32;
		declinatieminuut=18;
	}
	
	
	// 71-80
	
	
	
	
	if ( objectnaam	== @"M71") {
		
		rechteklimminguur=19;
		rechteklimmingminuut=53.8;
		declinatieuur=18;
		declinatieminuut=47;
	}
	
	
	if ( objectnaam	== @"M72") {
		
		rechteklimminguur=20;
		rechteklimmingminuut=53.5;
		declinatieuur=-12;
		declinatieminuut=32;
	}
	
	
	if ( objectnaam	== @"M73") {
		
		rechteklimminguur=20;
		rechteklimmingminuut=58.9;
		declinatieuur=-12;
		declinatieminuut=38;
	}
	
	
	if ( objectnaam	== @"M74") {
		
		rechteklimminguur=1;
		rechteklimmingminuut=36.7;
		declinatieuur=15;
		declinatieminuut=47;
	}
	
	if ( objectnaam	== @"M75") {
		
		rechteklimminguur=20;
		rechteklimmingminuut=6.1;
		declinatieuur=21;
		declinatieminuut=55;
	}
	
	if ( objectnaam	== @"M76") {
		
		rechteklimminguur=1;
		rechteklimmingminuut=42.4;
		declinatieuur=51;
		declinatieminuut=34;
	}
	
	if ( objectnaam	== @"M77") {
		
		rechteklimminguur=2;
		rechteklimmingminuut=42.7;
		declinatieuur=0;
		declinatieminuut=1;
	}
	
	if ( objectnaam	== @"M78") {
		
		rechteklimminguur=5;
		rechteklimmingminuut=46.7;
		declinatieuur=0;
		declinatieminuut=3;
	}
	
	if ( objectnaam	== @"M79") {
		
		rechteklimminguur=5;
		rechteklimmingminuut=24.5;
		declinatieuur=-24;
		declinatieminuut=33;
	}
	
	
	if ( objectnaam	== @"M80") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=17;
		declinatieuur=-22;
		declinatieminuut=59;
	}
	

	// 81-90
	
	
	
	
	if ( objectnaam	== @"M81") {
		
		rechteklimminguur=9;
		rechteklimmingminuut=55.6;
		declinatieuur=69;
		declinatieminuut=4;
	}
	
	
	if ( objectnaam	== @"M82") {
		
		rechteklimminguur=9;
		rechteklimmingminuut=55.8;
		declinatieuur=69;
		declinatieminuut=41;
	}
	
	
	if ( objectnaam	== @"M83") {
		
		rechteklimminguur=13;
		rechteklimmingminuut=37;
		declinatieuur=-29;
		declinatieminuut=52;
	}
	
	
	if ( objectnaam	== @"M84") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=25.1;
		declinatieuur=12;
		declinatieminuut=53;
	}
	
	if ( objectnaam	== @"M85") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=25.4;
		declinatieuur=18;
		declinatieminuut=11;
	}
	
	if ( objectnaam	== @"M86") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=26.2;
		declinatieuur=12;
		declinatieminuut=57;
	}
	
	if ( objectnaam	== @"M87") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=30.8;
		declinatieuur=12;
		declinatieminuut=24;
	}
	
	if ( objectnaam	== @"M88") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=32;
		declinatieuur=14;
		declinatieminuut=25;
	}
	
	if ( objectnaam	== @"M89") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=35.7;
		declinatieuur=12;
		declinatieminuut=33;
	}
	
	
	if ( objectnaam	== @"M90") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=36.8;
		declinatieuur=13;
		declinatieminuut=10;
	}
	
	
	// 91-100
	
	
	
	
	if ( objectnaam	== @"M91") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=35.5;
		declinatieuur=14;
		declinatieminuut=30;
	}
	
	
	if ( objectnaam	== @"M92") {
		
		rechteklimminguur=17;
		rechteklimmingminuut=17.1;
		declinatieuur=43;
		declinatieminuut=8;
	}
	
	
	if ( objectnaam	== @"M93") {
		
		rechteklimminguur=7;
		rechteklimmingminuut=44.6;
		declinatieuur=-23;
		declinatieminuut=52;
	}
	
	
	if ( objectnaam	== @"M94") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=50.9;
		declinatieuur=41;
		declinatieminuut=7;
	}
	
	if ( objectnaam	== @"M95") {
		
		rechteklimminguur=10;
		rechteklimmingminuut=44;
		declinatieuur=11;
		declinatieminuut=42;
	}
	
	if ( objectnaam	== @"M96") {
		
		rechteklimminguur=10;
		rechteklimmingminuut=46.8;
		declinatieuur=11;
		declinatieminuut=49;
	}
	
	if ( objectnaam	== @"M97") {
		
		rechteklimminguur=11;
		rechteklimmingminuut=14.8;
		declinatieuur=55;
		declinatieminuut=1;
	}
	
	if ( objectnaam	== @"M98") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=13.8;
		declinatieuur=14;
		declinatieminuut=54;
	}
	
	if ( objectnaam	== @"M99") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=18.8;
		declinatieuur=14;
		declinatieminuut=25;
	}
	
	
	if ( objectnaam	== @"M100") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=22.9;
		declinatieuur=15;
		declinatieminuut=49;
	}
	
	// 101-110
	
	
	
	
	if ( objectnaam	== @"M101") {
		
		rechteklimminguur=14;
		rechteklimmingminuut=3.2;
		declinatieuur=54;
		declinatieminuut=21;
	}
	
	
	if ( objectnaam	== @"M102") {
		
		rechteklimminguur=15;
		rechteklimmingminuut=6.5;
		declinatieuur=55;
		declinatieminuut=46;
	}
	
	
	if ( objectnaam	== @"M103") {
		
		rechteklimminguur=1;
		rechteklimmingminuut=33.2;
		declinatieuur=60;
		declinatieminuut=42;
	}
	
	
	if ( objectnaam	== @"M104") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=40;
		declinatieuur=-11;
		declinatieminuut=37;
	}
	
	if ( objectnaam	== @"M105") {
		
		rechteklimminguur=10;
		rechteklimmingminuut=47.8;
		declinatieuur=12;
		declinatieminuut=35;
	}
	
	if ( objectnaam	== @"M106") {
		
		rechteklimminguur=12;
		rechteklimmingminuut=19;
		declinatieuur=47;
		declinatieminuut=18;
	}
	
	if ( objectnaam	== @"M107") {
		
		rechteklimminguur=16;
		rechteklimmingminuut=32.5;
		declinatieuur=-13;
		declinatieminuut=3;
	}
	
	if ( objectnaam	== @"M108") {
		
		rechteklimminguur=11;
		rechteklimmingminuut=11.5;
		declinatieuur=55;
		declinatieminuut=40;
	}
	
	if ( objectnaam	== @"M109") {
		
		rechteklimminguur=11;
		rechteklimmingminuut=57.6;
		declinatieuur=53;
		declinatieminuut=23;
	}
	
	
	if ( objectnaam	== @"M110") {
		
		rechteklimminguur=0;
		rechteklimmingminuut=40.4;
		declinatieuur=41;
		declinatieminuut=41;
	}
	
	
	
	
	
	
}



@end
