//
//  IPhotoEvent.m
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "IPhotoEvent.h"


@implementation IPhotoEvent
@synthesize name;
@synthesize date;
@synthesize movieCount;


- (id)initWithName:(NSString *)pName andDate:(NSString *)pDate andMovieCount:(NSString *) pMovieCount
{
	if (! (self = [super init])) {
		NSLog(@"MyDataObject **** ERROR : [super init] failed ***");
		return self;
	} // end if
	
	self.name = pName;
	self.date = pDate;
	self.movieCount = pMovieCount;
	return self;
	
} 
@end
