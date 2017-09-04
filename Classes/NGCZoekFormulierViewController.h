//
//  ZoekFormulierViewController.h
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "catalogus.h"


@interface NGCZoekFormulierViewController : UIViewController  < UITableViewDataSource, UITableViewDelegate> {
   UITableView *mainTableView;
   NSMutableArray *contentsList;
   NSMutableArray *searchResults;

   NSString *savedSearchTerm;
    NSString *databaseName;
    NSString *databasePath;   
	
	
}


@property (nonatomic, retain) IBOutlet UITableView *mainTableView;
@property (nonatomic, retain) NSMutableArray *contentsList;
@property (nonatomic, retain) NSMutableArray *searchResults;
@property (nonatomic, retain) NSString *savedSearchTerm;
@property (nonatomic, retain) NSString *databaseName, *databasePath;


- (void)handleSearchForTerm:(NSString *)searchTerm;
- (void)checkAndCreateDatabase;
- (void)readObjectsFromDatabase;

@end
