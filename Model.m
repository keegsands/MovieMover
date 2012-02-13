//
//  Model.m
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "IPhotoEvent.h"
#import "Model.h"


@implementation Model
@synthesize iPhotoEvents;
@synthesize iPhotoLibraryPath;
@synthesize iMovieEventsPath;

-(void)loadData
{
	iPhotoLibraryPath = @"/Users/keegsands";
	iMovieEventsPath = @"/Users/keegsands/";
	iPhotoEvents = [NSMutableArray new];
	
	//This is just for testing ultimately this will just refresh
	[self addSampleData:true];
	
	//Commented out for testing
	//[self refreshEvents];
	
}

- (void)addEvent:(IPhotoEvent *)event 
{
	[iPhotoEvents addObject:event];
}


- (void)removeAllEvents
{
	[iPhotoEvents removeAllObjects];
}

-(void)refreshEvents
{
	
	NSURL *temporaryDirectoryURL = [NSURL fileURLWithPath:self.iMovieEventsPath isDirectory:YES];
	NSFileWrapper * dir = [[NSFileWrapper alloc] initWithURL:temporaryDirectoryURL options:NSFileWrapperReadingImmediate error:nil];
	NSDictionary * dirFiles = [dir fileWrappers];	
	
	[self removeAllEvents];
	for (id key in dirFiles) {
		NSDictionary * current = [[dirFiles objectForKey:key] fileAttributes];
		if([[current objectForKey:NSFileType] isEqualToString:NSFileTypeDirectory])
		{
			IPhotoEvent * sampleEvent = [[IPhotoEvent alloc]initWithName:key andDate:[[current objectForKey:NSFileModificationDate] description] andMovieCount:[current objectForKey:NSFileType]] ;
			[self addEvent:sampleEvent];
		}
		NSLog(@"file name: %@", [current objectForKey:NSFileModificationDate]);
	}
	NSLog(@"Directory name :%@ not NULL",[dir filename]);

	NSLog(@"Number of files :%d not NULL",[dirFiles count]);
	// Added for testing
	[self addSampleData:FALSE];

}

-(void)addSampleData:(BOOL) isInitial
{
	if(isInitial)
	{
		IPhotoEvent * sampleEvent = [[IPhotoEvent alloc]initWithName:@"Kaleb's Birthday Party" andDate:@"2009-02-15" andMovieCount:@"1"] ;
		IPhotoEvent * sampleEvent2 = [[IPhotoEvent alloc]initWithName:@"Sunny Monday" andDate:@"2009-02-16" andMovieCount:@"12"];
		[self addEvent:sampleEvent];
		[self addEvent:sampleEvent2];
	}
	else
	{
		
		IPhotoEvent * sampleEvent = [[IPhotoEvent alloc]initWithName:@"St. Patricks Day" andDate:@"2009-03-17" andMovieCount:@"6"];
		[self addEvent:sampleEvent];
	}
	
}

@end
