//
//  MyTouchView.m
//  TouchesDemo
//
//  Created by Juan Alberto López Cavallotti on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyTouchView.h"

@implementation MyTouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", touches);
    UITouch *touch = [touches anyObject];
    NSLog(@"%@", touch);
    [touch locationInView:self.superview];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Shaken");
        
    }
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}
@end
