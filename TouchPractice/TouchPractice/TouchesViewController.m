//
//  TouchesViewController.m
//  TouchPractice
//
//  Created by Juan Alberto López Cavallotti on 13/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TouchesViewController.h"

@interface TouchesViewController ()

@property (nonatomic, weak) IBOutlet UIImageView* imgView;

@end

@implementation TouchesViewController

@synthesize imgView = _imgView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (IBAction)rotate:(UIRotationGestureRecognizer *)sender 
{
    
    CGFloat angle = [sender rotation];
    [sender setRotation:0];
    
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, angle);
}

- (IBAction)scale:(UIPinchGestureRecognizer *)sender {
    
    CGFloat scale = [sender scale];
    [sender setScale:1];
    self.imgView.transform = CGAffineTransformScale(self.imgView.transform, scale, scale);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    
    CGPoint p = [sender translationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateChanged) {
    
        self.imgView.transform = CGAffineTransformMakeTranslation(p.x, p.y);
    
    
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        CGPoint np = CGPointMake(self.imgView.center.x + p.x, self.imgView.center.y + p.y);
        
        self.imgView.transform = CGAffineTransformMakeTranslation(0, 0);
        self.imgView.center = np;
    }
    
}

@end
