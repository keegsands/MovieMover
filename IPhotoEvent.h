//
//  IPhotoEvent.h
//  MovieMover
//
//  Created by Keegan on 2/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface IPhotoEvent : NSObject {
	NSString *name;
	NSString *date;
	NSString *movieCount;

}

@property (copy) NSString *name;
@property (copy) NSString *date;
@property (copy) NSString *movieCount;

- (id)initWithName:(NSString *)pName andDate:(NSString *)pDate andMovieCount:(NSString *)pMovieCount;

@end
