//
//  Model.h
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "IPhotoEvent.h"
#import <Cocoa/Cocoa.h>


@interface Model : NSObject {
	
	@private NSMutableArray *iPhotoEvents;
	@private NSString * iPhotoLibraryPath;
	@private NSString * iMovieEventsPath;

}
@property (assign) NSMutableArray * iPhotoEvents;
@property (assign) NSString * iPhotoLibraryPath;
@property (assign) NSString * iMovieEventsPath;

-(void)addEvent:(IPhotoEvent *)event;
-(void)loadData;
-(void)refreshEvents;
-(void)addSampleData:(BOOL) isInitial;
-(void)removeAllEvents;



@end
