//
//  ZoekFormulierViewController.m
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import "MessierZoekFormulierViewController.h"
#import "MySingleton.h"
#import <sqlite3.h>
#import "catalogus.h"


@implementation MessierZoekFormulierViewController


@synthesize mainTableView;
@synthesize contentsList;
@synthesize searchResults;
@synthesize savedSearchTerm;
@synthesize databaseName, databasePath;

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidLoad
{

	[super viewDidLoad];
    	[self.mainTableView
	 setBackgroundColor:[UIColor blackColor]];
    
    
	
    UIColor *NightColor=[UIColor colorWithRed:70 green:0 blue:0 alpha:0.8];
    [self.mainTableView setSeparatorColor:NightColor];


    // Do any additional setup after loading the view, typically from a nib.
    
    databaseName = @"catalogus.sqlite";
    // Get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent: databaseName];
    
    
    
    
    [self checkAndCreateDatabase];
    [self readObjectsFromDatabase];
    
	
	
    // Deze vervangen voor de databaseversie
	

	
[self setContentsList:contentsList];

    
    
// [contentsList release], contentsList = nil;
     
     
    
    
	// Restore search term
	if ([self savedSearchTerm])
	{
		[[[self searchDisplayController] searchBar] setText:[self savedSearchTerm]];

			
	}	
	
}


- (void)viewWillAppear:(BOOL)animated
{
	
	
	[super viewWillAppear:animated];
	
	[[self mainTableView] reloadData];
	
	
}






- (void)handleSearchForTerm:(NSString *)searchTerm
{
	[self setSavedSearchTerm:searchTerm];
	
	if ([self searchResults] == nil)
	{
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[self setSearchResults:array];
	 array = nil;
	}
	
	[[self searchResults] removeAllObjects];
	
	if ([[self savedSearchTerm] length] != 0)
	{
        
        

        for (catalogus  *zoekcatalogus in [self contentsList]) {

			if ([zoekcatalogus.objectID rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location != NSNotFound)
			{
				[[self searchResults] addObject:zoekcatalogus.objectID];

                
                
			}
		}
	}
}



- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section
{
	NSInteger rows;
	
	if (tableView == [[self searchDisplayController] searchResultsTableView])
		rows = [[self searchResults] count];
	else
		rows = [[self contentsList] count];
	
	return rows;
}



- (void) tableView:(UITableView *) tableView
didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	
	
	
	UITableViewCell *cell;
	cell = [tableView cellForRowAtIndexPath:indexPath];	
    
    UIView *bgColorView = [[UIView alloc] init];
    
        UIColor *NightColor=[UIColor colorWithRed:70 green:0 blue:0 alpha:0.8];
    
    [bgColorView setBackgroundColor:NightColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    catalogus *mijnCatalogus = (catalogus *)[self.contentsList objectAtIndex: indexPath.row];
    // Kommas naar punten
    
    NSString *RAString = [mijnCatalogus.objectRA stringByReplacingOccurrencesOfString:@"," withString:@"."];
    NSString *DECString = [mijnCatalogus.objectDec stringByReplacingOccurrencesOfString:@"," withString:@"."];
    double rechteklimming = [RAString doubleValue]; 
    double declinatie = [DECString doubleValue]; 
 	[MySingleton sharedMySingleton].rechteklimming=rechteklimming;
    [MySingleton sharedMySingleton].declinatie=declinatie;    
    [MySingleton sharedMySingleton].objectkeuze = mijnCatalogus.objectID;
    [MySingleton sharedMySingleton].objectMagnitude=mijnCatalogus.objectMagnitude;
    [MySingleton sharedMySingleton].objectType=mijnCatalogus.objectType;
    [MySingleton sharedMySingleton].objectSize=mijnCatalogus.objectSize;
    [MySingleton sharedMySingleton].objectNotes=mijnCatalogus.objectNotes;
    [MySingleton sharedMySingleton].objectName=mijnCatalogus.objectName;
    [MySingleton sharedMySingleton].objectConst=mijnCatalogus.objectConstellation;

    if (tableView == [[self searchDisplayController] searchResultsTableView]) {
        
        
        
        for (catalogus  *zoekcatalogus in [self contentsList]) {
            
			if ([zoekcatalogus.objectID rangeOfString:cell.textLabel.text options:NSCaseInsensitiveSearch].location != NSNotFound)
			{

                
                NSString *RAString = [zoekcatalogus.objectRA stringByReplacingOccurrencesOfString:@"," withString:@"."];
                NSString *DECString = [zoekcatalogus.objectDec stringByReplacingOccurrencesOfString:@"," withString:@"."];
                
                float rechteklimming = [RAString floatValue]; 
                float declinatie = [DECString floatValue]; 

                [MySingleton sharedMySingleton].objectkeuze = zoekcatalogus.objectID;
                [MySingleton sharedMySingleton].rechteklimming=rechteklimming;
                [MySingleton sharedMySingleton].declinatie=declinatie;
                [MySingleton sharedMySingleton].objectMagnitude=zoekcatalogus.objectMagnitude;
                [MySingleton sharedMySingleton].objectType=zoekcatalogus.objectType;
                [MySingleton sharedMySingleton].objectSize=zoekcatalogus.objectSize;
                [MySingleton sharedMySingleton].objectNotes=zoekcatalogus.objectNotes;
                [MySingleton sharedMySingleton].objectName=zoekcatalogus.objectName;
                [MySingleton sharedMySingleton].objectConst=zoekcatalogus.objectConstellation;
                break;
                
                
			}
            
        }
        
        
        
        
        
    }
    

    
    
}







- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    

    
    
    NSInteger row = [indexPath row];
    NSString *contentForThisRow=NULL ;
    
	
	if (tableView == [[self searchDisplayController] searchResultsTableView]) {
		contentForThisRow = [[self searchResults] objectAtIndex:row];
        
    }
	else {
    catalogus *mijnCatalogus = (catalogus *)[self.contentsList objectAtIndex: row];
    contentForThisRow = mijnCatalogus.objectID; 
    }
    
    
	static NSString *CellIdentifier = @"CellIdentifier";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

    
    UIFont *myFont = [ UIFont fontWithName: @"System" size: 16.0 ];
    cell.textLabel.font  = myFont;
    // Set up the cell...
    
    UIColor *NightColor=[UIColor colorWithRed:70 green:0 blue:0 alpha:0.8];
    
    cell.textLabel.textColor=NightColor;
	[[cell textLabel] setText:contentForThisRow];

    
    
	return cell;
}







- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{
	[self setSavedSearchTerm:nil];
	
	[[self mainTableView] reloadData];
}




- (BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchString:(NSString *)searchString

{
    
    CGFloat nRed=84.0/255.0;
    CGFloat nBlue=8/255.0;
    CGFloat nGreen=4.0/255.0;
    UIColor *nightColor=[[UIColor alloc]initWithRed:nRed green:nBlue blue:nGreen alpha:1];
    [controller.searchResultsTableView setBackgroundColor:nightColor];
    controller.searchResultsTableView.bounces=FALSE;

	[self handleSearchForTerm:searchString];
	return YES;
}





- (void)viewDidUnload
{
	[super viewDidUnload];
	
	// Save the state of the search UI so that it can be restored if the view is re-created.
	[self setSavedSearchTerm:[[[self searchDisplayController] searchBar] text]];
	
	
	

	
	
	[self setSearchResults:nil];
}

- (void) checkAndCreateDatabase{
    
    // Check if the SQL database has already been saved to the users phone, if not then copy it over
    BOOL success;
    
    // Create a FileManager object, we will use this to check the status
    // of the database and to copy it over if required
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Check if the database has already been created in the users filesystem
    success = [fileManager fileExistsAtPath:databasePath];
    
    // If the database already exists then return without doing anything
    if(success) return;
    
    // If not then proceed to copy the database from the application to the users filesystem
    
    // Get the path to the database in the application package
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    
    // Copy the database from the package to the users filesystem
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    
    
    
    
}



- (void) readObjectsFromDatabase{
    
    
    // Setup the database object
    sqlite3 *database;
    
    contentsList = [[NSMutableArray alloc] init];
    
    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        // Setup the SQL Statement and compile it for faster access
        const char *sqlStatement = "select * from messier";
        
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                
                
                NSString *bOobjectID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *bobjectName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *bobjectType = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                NSString *bobjectRA = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                NSString *bobjectDec = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                NSString *bobjectMagnitude = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                NSString *bobjectSize = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
                NSString *bobjectConstellation = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];
                NSString *bobjectNotes = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];
                
                
                
                [self.contentsList addObject:[catalogus  objectWithID:bOobjectID objectName:bobjectName objectType:bobjectType objectRA:bobjectRA objectDec:bobjectDec objectMagnitude:bobjectMagnitude objectSize:bobjectSize objectConstellation:bobjectConstellation objectNotes:bobjectNotes]];
                
                
            }
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
        
    }
    

    
    
    sqlite3_close(database);
    
}



- (void)dealloc {
	
	

	
 mainTableView = nil;
 contentsList = nil;

searchResults = nil;
savedSearchTerm = nil;
	

	
	

}





@end
