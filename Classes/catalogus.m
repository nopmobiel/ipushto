//
//  ngcic.m
//  test
//
//  Created by Norbert Schmidt on 14-03-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//



#import "catalogus.h"

@implementation catalogus

@synthesize objectID,objectName, objectType,objectRA, objectDec, objectMagnitude, objectSize, objectConstellation, objectNotes;

+ (id) objectWithID:(NSString *)objectID objectName:(NSString *)objectName objectType:(NSString *)objectType objectRA:(NSString *)objectRA objectDec:(NSString *)objectDec objectMagnitude:(NSString *)objectMagnitude objectSize:(NSString *)objectSize objectConstellation:(NSString *)objectConstellation objectNotes:(NSString *)objectNotes{
        
    catalogus *newObject = [[self alloc] init] ;
    newObject.objectID = objectID;
    newObject.objectName = objectName;
    newObject.objectType = objectType;
    newObject.objectRA = objectRA;
    newObject.objectDec = objectDec;
    newObject.objectMagnitude = objectMagnitude;
    newObject.objectSize = objectSize;
    newObject.objectConstellation = objectConstellation;
    newObject.objectNotes = objectNotes;

        
    return newObject;
    
    
}





@end

