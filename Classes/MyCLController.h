//
//  MyCLController.h
//  IDSC
//
//  Created by Norbert Schmidt on 21-01-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyCLControllerDelegate 
@required
- (void)locationUpdate:(CLLocation *)location;
- (void)headingUpdate:(CLHeading *)heading;

- (void)locationError:(NSError *)error;
@end


@interface MyCLController : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	    id <MyCLControllerDelegate> __unsafe_unretained delegate;


}

@property (nonatomic, retain) CLLocationManager *locationManager;  
@property (unsafe_unretained) id   delegate;


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end

