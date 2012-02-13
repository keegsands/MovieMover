//
//  Controller.m
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "IPhotoEvent.h"
#import "Controller.h"

@implementation Controller

@synthesize iPhotoEventsTableView;
@synthesize iPhotoLibraryLocationField;
@synthesize iMovieEventsLocationField;
@synthesize model;

- (int)numberOfRowsInTableView:(NSTableView *)tableView;
{
	return ([[model iPhotoEvents] count]);
}


- (id) tableView:(NSTableView *)tableView 
objectValueForTableColumn:(NSTableColumn *)tableColumn
			 row:(int)row {
	
	IPhotoEvent * eventObject = (IPhotoEvent *)
	[model.iPhotoEvents objectAtIndex:row];
	if (! eventObject) {
		NSLog(@"tableView: objectAtIndex:%d = NULL",row);
		return NULL;
	}
		
	if ([[tableColumn identifier] isEqualToString:@"EventName"]) {
		return [eventObject name];
	}
	
	if ([[tableColumn identifier] isEqualToString:@"EventDate"]) {
		return [eventObject date];
	}
	
	if ([[tableColumn identifier] isEqualToString:@"EventCount"]) {
		return [eventObject movieCount];
	}
	
	NSLog(@"***ERROR** dropped through pTableColumn identifiers");
	return NULL;
	
}


-(IBAction)copyMoviesAction:(id) sender
{
	
}

-(IBAction)setiPhotoLibraryPath:(id) sender
{
	int result;
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
	
    [oPanel setAllowsMultipleSelection:NO];
	[oPanel setCanChooseFiles:TRUE];
	[oPanel setCanChooseDirectories:FALSE];
    result = [oPanel runModalForDirectory:NSHomeDirectory()
									 file:nil];
    if (result == NSOKButton) {

		model.iPhotoLibraryPath =  [[oPanel filenames] objectAtIndex:0];
		[iPhotoLibraryLocationField  setStringValue:model.iPhotoLibraryPath];
		
    }
	
}

-(IBAction)setiMovieEventsPath:(id) sender
{
	int result;
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
	
    [oPanel setAllowsMultipleSelection:NO];
	[oPanel setCanChooseFiles:FALSE];
	[oPanel setCanChooseDirectories:TRUE];
    result = [oPanel runModalForDirectory:NSHomeDirectory()
									 file:nil];
    if (result == NSOKButton) {
		model.iMovieEventsPath = [[oPanel filenames] objectAtIndex:0];
		[iMovieEventsLocationField  setStringValue:model.iMovieEventsPath];
		
    }
	
}

-(IBAction)refreshEventsTableAction:(id) sender
{
	//This is just for testing ultimately this will just refresh
	[model refreshEvents];
	// The logic for loading the list of events will happen here	
	[iPhotoEventsTableView reloadData];

}


- (void)awakeFromNib
{	
	model = [Model alloc];
	[model loadData];
	[iPhotoLibraryLocationField  setStringValue:model.iPhotoLibraryPath];
	[iMovieEventsLocationField  setStringValue:model.iMovieEventsPath];

	

	
}

- (void)dealloc
{
	[model.iPhotoEvents release];
	[super dealloc];
}


@end
