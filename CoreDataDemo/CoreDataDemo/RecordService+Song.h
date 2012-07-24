//
//  RecordService+Song.h
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecordService.h"

@interface RecordService (Song)

-(void) insertSong:(NSString*) song forArtist:(NSString*) artist;
-(NSArray*) listSongs;

@end
