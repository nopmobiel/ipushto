
//
//  Created by Norbert Schmidt on 14-03-12.
//  Copyright (c) 2012 DDQ. All rights reserved.
//

#import <Foundation/Foundation.h>

    @interface catalogus : NSObject {
        NSString *objectID;
        NSString *objectName;
        NSString *objectType;
        NSString *objectRA;
        NSString *objectDec;
        NSString *objectMagnitude;
        NSString *objectSize;
        NSString *objectConstellation;
        NSString *objectNotes;
        
    }
    
@property (nonatomic, copy)NSString *objectID, *objectName, *objectType, *objectRA,  *objectDec, *objectMagnitude, *objectSize, *objectConstellation, *objectNotes ;
    
    + (id)objectWithID:(NSString *)objectID
           objectName:(NSString *)objectName
           objectType:(NSString *)objectType 
           objectRA:(NSString *)objectRA
           objectDec:(NSString *)objectDec
           objectMagnitude:(NSString *)objectMagnitude
           objectSize:(NSString *)objectSize
           objectConstellation:(NSString *)objectConstellation
           objectNotes:(NSString *)objectNotes;


    
    @end
