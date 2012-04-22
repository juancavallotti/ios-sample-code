//
//  MarioView.m
//  Mario
//
//  Created by Juan Alberto López Cavallotti on 16/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MarioView.h"

@interface MarioView ()

@property (nonatomic, strong) NSArray *imagenes;
@property (nonatomic, strong) NSArray *animIzq;
@property (nonatomic, strong) NSArray *animDer;


@end


@implementation MarioView


@synthesize imagenes = _imagenes, animIzq = _animIzq, animDer = _animDer;

-(void)cargarImagenes {
    self.imagenes = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"racoon-l-0.png"],
                     [UIImage imageNamed:@"racoon-l-2.png"],
                     [UIImage imageNamed:@"racoon-l-3.png"],
                     [UIImage imageNamed:@"racoon-r-0.png"],
                     [UIImage imageNamed:@"racoon-r-2.png"],
                     [UIImage imageNamed:@"racoon-r-3.png"],
                     nil];
    self.animIzq = [NSArray arrayWithObjects: 
                    [self.imagenes objectAtIndex:0],
                    [self.imagenes objectAtIndex:1],
                    [self.imagenes objectAtIndex:2],
                    [self.imagenes objectAtIndex:1],                    
                    nil];
    self.animDer = [NSArray arrayWithObjects: 
                    [self.imagenes objectAtIndex:3],
                    [self.imagenes objectAtIndex:4],
                    [self.imagenes objectAtIndex:5],
                    [self.imagenes objectAtIndex:4],                    
                    nil];
    self.animationDuration = 0.4;
    self.animationRepeatCount = 0;
    self.image = [self.animDer objectAtIndex:0];
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cargarImagenes];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self cargarImagenes];
}

-(void)dealloc {
    self.animIzq = nil;
    self.animDer = nil;
    self.imagenes = nil;    
}

-(IBAction)animDerecha:(id)sender {
    self.animationImages = self.animDer;
    [self startAnimating];
}
-(IBAction)animIzquierda:(id)sender {
    self.animationImages = self.animIzq;
    [self startAnimating];
}
-(IBAction)stop:(id)sender {
    [self stopAnimating];
    self.image = [self.animationImages objectAtIndex:0];
}

@end
