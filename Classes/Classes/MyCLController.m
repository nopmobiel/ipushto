//
//  MyCLController.m
//  IDSC
//
//  Created by Norbert Schmidt on 21-01-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import "MyCLController.h"

@implementation MyCLController

@synthesize locationManager;
@synthesize delegate;

- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		self.locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{

        [self.delegate locationUpdate:newLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
		
	[self.delegate headingUpdate:newHeading];

}



- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerShouldDisplayHeadingCalibration:)]) {

		return [self.delegate locationManagerShouldDisplayHeadingCalibration:manager];
	}
	
	return YES;
}



- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
    [self.delegate locationError:error];
}




- (void)dealloc {
    [self.locationManager release];
    [super dealloc];
}

@end
