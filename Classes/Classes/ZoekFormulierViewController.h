//
//  ZoekFormulierViewController.h
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZoekFormulierViewController : UIViewController  < UITableViewDataSource, UITableViewDelegate> {
   UITableView *mainTableView;
   NSMutableArray *contentsList;
   NSMutableArray *searchResults;
   NSString *savedSearchTerm;

	
	
}


@property (nonatomic, retain) IBOutlet UITableView *mainTableView;
@property (nonatomic, retain) NSMutableArray *contentsList;
@property (nonatomic, retain) NSMutableArray *searchResults;
@property (nonatomic, copy) NSString *savedSearchTerm;

- (void)handleSearchForTerm:(NSString *)searchTerm;

@end
