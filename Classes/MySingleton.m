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
@synthesize rechteklimming;
@synthesize declinatie;
@synthesize objectMagnitude;
@synthesize objectSize;
@synthesize objectNotes;
@synthesize objectType;
@synthesize objectName;
@synthesize objectConst;

	
static MySingleton* _sharedMySingleton = nil;

+(MySingleton*)sharedMySingleton
{
    static MySingleton *sharedSomeClassInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedSomeClassInstance = [[self alloc] init];
    });
    return sharedSomeClassInstance;
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
	




@end
