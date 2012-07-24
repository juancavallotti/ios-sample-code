//
//  RecordService.m
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecordService.h"
#import <CoreData/CoreData.h>


@interface RecordService ()


-(void)initCoreData;

@end

@implementation RecordService

@synthesize  doc = _doc;


+(RecordService *)sharedInstance
{
    static RecordService* instance = nil;
    
    if (!instance) {
        instance = [[RecordService alloc] init];
    }
    
    return instance;
}

+ (void) initializeManagedDocument
{
    [[self sharedInstance] initCoreData];
}


-(void)initCoreData
{
    NSError* error;
    
    NSURL *docURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    docURL = [docURL URLByAppendingPathComponent:@"Data"];
    
    NSLog(@"Initializing core data...");
    
    //NSURL *docURL = [[NSFileManager defaultManager] URLByAppendingPathComponent:@"FirstDocument"];
    
    self.doc = [[UIManagedDocument alloc] initWithFileURL:docURL];
    
    
    //configure the store
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    self.doc.persistentStoreOptions = options;
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[docURL path]]) {
        [self.doc openWithCompletionHandler:^(BOOL success){
            if (!success) {
                // Handle the error.
                NSLog(@"Error creating managed document");
            }
        }];
    }
    else {
        [self.doc saveToURL:docURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            if (!success) {
                // Handle the error.
                NSLog(@"Error reading managed document");
            }
        }];
    }
}


@end
