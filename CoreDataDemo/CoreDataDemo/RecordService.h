//
//  RecordService.h
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordService : NSObject

+ (RecordService*) sharedInstance;
+ (void) initializeManagedDocument;

@property (nonatomic, strong) UIManagedDocument* doc;

@end
