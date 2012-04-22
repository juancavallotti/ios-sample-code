//
//  ViewController.m
//  Ensalada
//
//  Created by Juan Alberto López Cavallotti on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize panEvento;
@synthesize panX;
@synthesize panY;
@synthesize tapEvento;
@synthesize tapX;
@synthesize tapY;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setPanEvento:nil];
    [self setPanX:nil];
    [self setPanY:nil];
    [self setTapEvento:nil];
    [self setTapX:nil];
    [self setTapY:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (IBAction)deteccionDePan:(UIPanGestureRecognizer *)sender {
    
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.panEvento.text = @"Pan Iniciado";
    }
    if (sender.state == UIGestureRecognizerStateChanged) {
        self.panEvento.text = @"Pan Cambio";
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.panEvento.text = @"Pan Termino";
    }
    if (sender.state == UIGestureRecognizerStateCancelled) {
        self.panEvento.text = @"Pan Fallo";
    }
    
    CGPoint punto = [sender translationInView:self.view];
    self.panX.text = [NSString stringWithFormat:@"%f", punto.x];
    self.panY.text = [NSString stringWithFormat:@"%f", punto.y];
    
}
- (IBAction)deteccionDeTap:(UITapGestureRecognizer *)sender {
    self.tapEvento.text = @"Tap!";
    CGPoint punto = [sender locationInView:self.view];
    self.tapX.text = [NSString stringWithFormat:@"%f", punto.x];
    self.tapY.text = [NSString stringWithFormat:@"%f", punto.y];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft
    || interfaceOrientation == UIInterfaceOrientationLandscapeRight
    ;
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"Will Rotate ");
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"Did Rotate ");    
}
@end
