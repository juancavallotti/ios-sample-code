//
//  AnimsViewController.m
//  Animations
//
//  Created by Juan Alberto López Cavallotti on 15/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimsViewController.h"
#import "MarioView.h"

@interface AnimsViewController ()

@property (weak, nonatomic) IBOutlet MarioView *marioView;


@end

@implementation AnimsViewController
@synthesize marioView = _marioView;
- (IBAction)playBtn:(id)sender {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.pauseBtn removeFromSuperview];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMarioView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)walkL:(id)sender {
    [UIView animateWithDuration:2 
                     animations: ^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.marioView animateLeft:nil];
                         self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform,-200, 0);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self.marioView stop:nil];
                         }
                     }];
}

- (IBAction)walkR:(id)sender {
    [UIView animateWithDuration:2 
                     animations: ^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.marioView animateRight:nil];
                         self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform,200, 0);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self.marioView stop:nil];
                         }
                     }];
}

- (IBAction)jump:(id)sender {
    [UIView animateWithDuration:0.5 
                     animations:^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, 0.0, -150);
                     } 
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5 
                                          animations:^{
                                              [UIView setAnimationBeginsFromCurrentState:YES];
                                              self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, 0.0, 150.0);
                                          }
                                          completion:^(BOOL finished) {
                                              [self.marioView stop:nil];
                                          }];
                     }];
}

- (IBAction)ljump:(id)sender {
    [UIView animateWithDuration:0.5 
                     animations:^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.marioView jumpLeft:sender];
                         self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, -100.0, -150);
                     } 
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5 
                                          animations:^{
                                              [UIView setAnimationBeginsFromCurrentState:YES];
                                              self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, -100.0, 150.0);
                                          }
                                          completion:^(BOOL finished) {
                                              [self.marioView stop:nil];
                                              [self.marioView faceLeft:nil];
                                          }];
                     }];
}
- (IBAction)rjump:(id)sender {
    [UIView animateWithDuration:0.5 
                     animations:^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.marioView jumpRight:sender];
                         self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, 100.0, -150);
                     } 
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5 
                                          animations:^{
                                              [UIView setAnimationBeginsFromCurrentState:YES];
                                              self.marioView.transform = CGAffineTransformTranslate(self.marioView.transform, 100.0, 150.0);
                                          }
                                          completion:^(BOOL finished) {
                                              [self.marioView stop:nil];
                                              [self.marioView faceRight:nil];
                                          }];
                     }];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
