//
//  TouchesViewController.m
//  TouchesDemo
//
//  Created by Juan Alberto López Cavallotti on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TouchesViewController.h"
#import "MyTouchView.h"

@interface TouchesViewController ()
@property (weak, nonatomic) IBOutlet MyTouchView *touchView;

@end

@implementation TouchesViewController
@synthesize touchView;
@synthesize output;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.touchView becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setOutput:nil];
    [self setTouchView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    self.output.text = [@"Pinch: " stringByAppendingFormat:@"%f",sender.scale];
}


@end
