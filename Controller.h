//
//  Controller.h
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "Model.h"
#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {

	IBOutlet NSTableView *iPhotoEventsTableView;
	IBOutlet id iPhotoLibraryLocationField;
	IBOutlet id iMovieEventsLocationField;
	@private Model *model;
	
	}
@property (assign) NSTableView * iPhotoEventsTableView;
@property (assign) NSString * iPhotoLibraryLocationField;
@property (assign) NSString * iMovieEventsLocationField;
@property (assign) Model * model;

-(IBAction)copyMoviesAction:(id) sender;
-(IBAction)refreshEventsTableAction:(id) sender;
-(IBAction)setiPhotoLibraryPath:(id) sender;
-(IBAction)setiMovieEventsPath:(id) sender;


@end
