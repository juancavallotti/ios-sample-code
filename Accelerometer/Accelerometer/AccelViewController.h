//
//  AccelViewController.h
//  Accelerometer
//
//  Created by Juan Alberto López Cavallotti on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccelViewController : UIViewController <UIAccelerometerDelegate>

@property (nonatomic,weak) IBOutlet UIImageView* imgView;

@end
