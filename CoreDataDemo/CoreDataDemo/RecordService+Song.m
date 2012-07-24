//
//  RecordService+Song.m
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecordService+Song.h"
#import <CoreData/CoreData.h>
#import "Song.h"


@implementation RecordService (Song)

-(void) insertSong:(NSString*) song forArtist:(NSString*) artist
{
    NSManagedObjectContext* context = self.doc.managedObjectContext;
    
    [context performBlockAndWait:^{
        Song* s = [NSEntityDescription insertNewObjectForEntityForName:@"Song" inManagedObjectContext:context];
        s.artist = artist;
        s.title = song;
        
        [context processPendingChanges];        
    }];
}
-(NSArray*) listSongs
{
    
    NSManagedObjectContext* context = self.doc.managedObjectContext;
    __block NSArray* ret = nil;
    
    [context performBlockAndWait:^{
        NSFetchRequest* req = [NSFetchRequest fetchRequestWithEntityName:@"Song"];
        ret = [context executeFetchRequest:req error:nil];
    }];
    
    
    return  ret;
}

@end
