//
//  CreateViewController.h
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateViewControllerDelegate <NSObject>

-(void) addedNewRecord;

@end


@interface CreateViewController : UIViewController

@property (nonatomic, strong) id <CreateViewControllerDelegate> delegate;

@end
