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
double	rechteklimming;
double	declinatie;
NSString *objectName;
NSString *objectConst;
NSString *objectMagnitude;
NSString *objectSize;
NSString *objectNotes;
NSString *objectType;
}
@property (nonatomic, retain) NSString* objectName; 
@property (nonatomic, retain) NSString* objectkeuze; 
@property (nonatomic, retain) NSString* objectMagnitude; 
@property (nonatomic, retain) NSString* objectSize; 
@property (nonatomic, retain) NSString* objectNotes; 
@property (nonatomic, retain) NSString* objectType; 
@property (nonatomic, retain) NSString* objectConst; 
@property(nonatomic, assign) double rechteklimming;
@property(nonatomic, assign) double declinatie;

+(MySingleton*)sharedMySingleton;


@end
