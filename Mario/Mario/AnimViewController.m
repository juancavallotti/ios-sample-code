//
//  AnimViewController.m
//  Mario
//
//  Created by Juan Alberto López Cavallotti on 16/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimViewController.h"
#import "MarioView.h"

@interface AnimViewController ()

@property (weak, nonatomic) IBOutlet MarioView *mario;

@end

@implementation AnimViewController
@synthesize mario = _mario;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMario:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (IBAction)moverIzq:(id)sender {
    [UIView animateWithDuration:2 
                          delay:0 
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.mario animIzquierda:sender];
                         self.mario.transform = CGAffineTransformTranslate(self.mario.transform, -200, 0);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self.mario stop:sender];
                         }
                     }];
    
    
    
}



- (IBAction)moverDer:(id)sender {
    
    [UIView animateWithDuration:2 
                     animations:^{
                         [UIView setAnimationBeginsFromCurrentState:YES];
                         [self.mario animDerecha:sender];
                         self.mario.transform = CGAffineTransformTranslate(self.mario.transform, 200, 0);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self.mario stop:sender];
                         }
                     }];
    
    
    
}


@end
