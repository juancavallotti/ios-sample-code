//
//  AccelViewController.m
//  Accelerometer
//
//  Created by Juan Alberto López Cavallotti on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccelViewController.h"

#define UPDATE_INTERVAL 0.1

@interface AccelViewController () {
    double spdX;
    double spdY;
}

@end

@implementation AccelViewController

@synthesize imgView = _imgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIAccelerometer* accel = [UIAccelerometer sharedAccelerometer];
    accel.updateInterval = UPDATE_INTERVAL;
    accel.delegate = self;
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationPortrait == interfaceOrientation;
}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    CGPoint center = self.imgView.center;
    double t = UPDATE_INTERVAL;
    double t2 = t*t;
    
    double ax = (6000.0 * acceleration.x);
    double ay = (-6000.0 * acceleration.y);
    
    //capture the acceleration.
    double finalX = center.x + spdX * t + 0.5 * ax * t2;
    double finalY = center.y + spdY * t + 0.5 * ay * t2;
    
    //calculate the final speed
    spdX = ax * t;
    spdY = ay * t;
    
    //check that the boundaries are not exceeded
    CGFloat minX = self.imgView.frame.size.width/2.0;
    CGFloat minY = self.imgView.frame.size.height/2.0;
    
    if (finalX < minX) {
        finalX = minX;
        spdX = 0;
    }
    
    if (finalY < minY) {
        finalY = minY;
        spdY = 0;
    }
    
    CGFloat maxX = self.view.frame.size.width - self.imgView.bounds.size.width / 2.0;
    CGFloat maxY = self.view.frame.size.height - self.imgView.bounds.size.height / 2.0;
    
    if (finalX > maxX) {
        finalX = maxX;
        spdX = 0;
    }

    if (finalY > maxY) {
        finalY = maxY;
        spdX = 0;
    }
    
    //estimate the angle of rotation
    double modA = sqrt(ax*ax + ay*ay);
    double sinAngle = ax / modA;
    double angle = -1 * asin(sinAngle);
    
    if (ay < 0) {
        angle = angle + M_PI;
    }
    
    //finally, animate
    [UIView animateWithDuration:t 
                          delay:0 
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ {
                         self.imgView.center = CGPointMake(finalX, finalY);
                         self.imgView.transform = CGAffineTransformMakeRotation(angle);
                     } 
                     completion:^(BOOL interrupted){}];
    
}

@end
