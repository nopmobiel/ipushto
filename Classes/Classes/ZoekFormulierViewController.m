//
//  ZoekFormulierViewController.m
//  IDSC
//
//  Created by Norbert Schmidt on 02-02-11.
//  Copyright 2011 DDQ. All rights reserved.
//

#import "ZoekFormulierViewController.h"
#import "MySingleton.h"


@implementation ZoekFormulierViewController


@synthesize mainTableView;
@synthesize contentsList;
@synthesize searchResults;
@synthesize savedSearchTerm;



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidLoad
{

	[super viewDidLoad];
	
	NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
							 @"M1",  @"M2", @"M3", @"M4", @"M5",   @"M6", @"M7", @"M8", @"M9", @"M10",   
							 @"M11", @"M12", @"M13", @"M14", @"M15", @"M16", @"M17", @"M18", @"M19", 
							 @"M20", @"M21", @"M22", @"M23", @"M24", @"M25", @"M26", @"M27", @"M28", @"M29", 
							 @"M30", @"M31", @"M32", @"M33", @"M34", @"M35", @"M36", @"M37", @"M38", @"M39",
							 @"M40", @"M41", @"M42", @"M43", @"M44", @"M45", @"M46", @"M47", @"M48", @"M49", 
							 @"M50", @"M51", @"M52", @"M53", @"M54", @"M55", @"M56", @"M57", @"M58", @"M59", 
							 @"M60", @"M61", @"M62", @"M63", @"M64", @"M65", @"M66", @"M67", @"M68", @"M69", 
							 @"M70", @"M71", @"M72", @"M73", @"M74", @"M75", @"M76", @"M77", @"M78", @"M79", 
							 @"M80", @"M81", @"M82", @"M83", @"M84", @"M85", @"M86", @"M87", @"M88", @"M89", 
							 @"M90", @"M91", @"M92", @"M93", @"M94", @"M95", @"M96", @"M97", @"M98", @"M99", 
							 @"M100", @"M101", @"M102", @"M103", @"M104",   @"M105", @"M106", @"M107", @"M108", @"M109", @"M110", nil];
	
	
	
	
	
	[self setContentsList:array];
	[array release], array = nil;
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
		[array release], array = nil;
	}
	
	[[self searchResults] removeAllObjects];
	
	if ([[self savedSearchTerm] length] != 0)
	{
		for (NSString *currentString in [self contentsList])
		{
			if ([currentString rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location != NSNotFound)
			{
				[[self searchResults] addObject:currentString];
				
								
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
	
	
	
	[MySingleton sharedMySingleton].objectkeuze = cell.textLabel.text;
	// RADEC vullen.
	
	[MySingleton sharedMySingleton].haalObjectGegevensOp;
	
	

	
	
	
	
	
	// [[MySingleton sharedMySingleton] laatObjectzien]; 
	


}







- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger row = [indexPath row];
	NSString *contentForThisRow = nil;
	
	if (tableView == [[self searchDisplayController] searchResultsTableView])
		contentForThisRow = [[self searchResults] objectAtIndex:row];

	else
		contentForThisRow = [[self contentsList] objectAtIndex:row];
		
	static NSString *CellIdentifier = @"CellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
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




- (void)dealloc {
	
	

	
	[mainTableView release], mainTableView = nil;
	[contentsList release], contentsList = nil;

	[searchResults release], searchResults = nil;
	[savedSearchTerm release], savedSearchTerm = nil;
	
	[super dealloc];
	
	

}





@end
