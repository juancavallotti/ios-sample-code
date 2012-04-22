//
//  MarioView.h
//  Animations
//
//  Created by Juan Alberto López Cavallotti on 15/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarioView : UIImageView

-(IBAction)animateLeft:(id)sender;
-(IBAction)jumpLeft:(id)sender;
-(IBAction)jumpRight:(id)sender;
-(IBAction)animateRight:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)faceLeft:(id)sender;
-(IBAction)faceRight:(id)sender;


@end
