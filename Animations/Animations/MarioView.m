//
//  MarioView.m
//  Animations
//
//  Created by Juan Alberto López Cavallotti on 15/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MarioView.h"

@interface MarioView ()

//groups of images.
@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong) NSArray* marioLeft;
@property (nonatomic, strong) NSArray* marioRight;
@end

@implementation MarioView

@synthesize images = _images, marioLeft = _marioLeft, marioRight = _marioRight;

-(void) loadImagesAndSetup {
    //configure the basic mario animation
    self.animationRepeatCount = 0;
    self.animationDuration = 0.4;
    
    self.images = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"racoon-l-0.png"],
                   [UIImage imageNamed:@"racoon-l-1.png"],
                   [UIImage imageNamed:@"racoon-l-2.png"],
                   [UIImage imageNamed:@"racoon-l-3.png"],
                   [UIImage imageNamed:@"racoon-r-0.png"],
                   [UIImage imageNamed:@"racoon-r-1.png"],
                   [UIImage imageNamed:@"racoon-r-2.png"],
                   [UIImage imageNamed:@"racoon-r-3.png"],
                   [UIImage imageNamed:@"racoon-lj-0.png"],
                   [UIImage imageNamed:@"racoon-rj-0.png"],                   
                   nil];
    
    self.marioRight = [NSArray arrayWithObjects:
                       [self.images objectAtIndex:4],
                       [self.images objectAtIndex:6],
                       [self.images objectAtIndex:7],
                       [self.images objectAtIndex:6],
                       nil];
    
    self.marioLeft = [NSArray arrayWithObjects:
                      [self.images objectAtIndex:0],
                      [self.images objectAtIndex:2],
                      [self.images objectAtIndex:3],
                      [self.images objectAtIndex:2],
                      nil];
    
    //configure the initial set of images
    self.animationImages = self.marioRight;
    self.image = [self.animationImages objectAtIndex:0];
}


-(void)animateLeft:(id)sender {
    self.animationImages = self.marioLeft;
    self.image = [self.animationImages objectAtIndex:0];
    [self startAnimating];    
}

-(void)animateRight:(id)sender {
    self.animationImages = self.marioRight;
    self.image = [self.animationImages objectAtIndex:0];
    [self startAnimating];
}

-(void)stop:(id) sender {
    self.image = [self.animationImages objectAtIndex:0];
    [self stopAnimating];
}

-(void)jumpLeft:(id)sender {
    if (self.isAnimating) {
        [self stopAnimating];
    }
    self.image = [self.images objectAtIndex:8];
}

-(void)jumpRight:(id)sender {
    if (self.isAnimating) {
        [self stopAnimating];
    }
    self.image = [self.images objectAtIndex:9];    
}

-(IBAction)faceLeft:(id)sender {
    self.image = [self.images objectAtIndex:0];
}
-(IBAction)faceRight:(id)sender {
    self.image = [self.images objectAtIndex:4];    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadImagesAndSetup];
    }
    return self;
}

-(void)awakeFromNib {
    [self loadImagesAndSetup];
}

- (void)dealloc
{
    self.images = nil;
    self.marioLeft = nil;
    self.marioRight = nil;
}

@end
