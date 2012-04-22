//
//  VistaAgitada.m
//  Ensalada
//
//  Created by Juan Alberto López Cavallotti on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VistaAgitada.h"

@implementation VistaAgitada

@synthesize labelInicio = _labelInicio, labelFin = _labelFin;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake){
        self.labelInicio.text = @"Sacudida Iniciada";
    }
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake){
        self.labelFin.text = @"Sacudida Finalizada";
    }    
}

@end
