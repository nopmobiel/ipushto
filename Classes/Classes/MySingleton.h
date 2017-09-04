//
//  MySingleton.h
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MySingleton : NSObject {
NSString *objectkeuze;
float	rechteklimminguur;
float	rechteklimmingminuut;
float	declinatieuur;
float	declinatieminuut;

	
}


@property (nonatomic, retain) NSString* objectkeuze; 

@property(nonatomic, assign) float rechteklimminguur;
@property(nonatomic, assign) float rechteklimmingminuut;
@property(nonatomic, assign) float declinatieuur;
@property(nonatomic, assign) float declinatieminuut;




+(MySingleton*)sharedMySingleton;
-(void)haalObjectGegevensOp ;


@end
