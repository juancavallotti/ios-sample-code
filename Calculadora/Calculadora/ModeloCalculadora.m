//
//  ModeloCalculadora.m
//  Calculadora
//
//  Created by Juan Alberto López Cavallotti on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeloCalculadora.h"


@interface ModeloCalculadora() {
    double entrada;
    char operacion;
}

@end

@implementation ModeloCalculadora

@synthesize buffer;
@synthesize entrada;
@synthesize delegate = _delegate;

- (id)init {
    self = [super init];
    if (self) {
        [self limpiar];
    }
    return self;
}


-(double)ingresarNumero:(int)numero {
    entrada = entrada * 10.0 + numero;
    return entrada;
}


-(void)limpiar {
    buffer = 0.0;
    entrada = 0.0;
    operacion = 0;
}

-(double)operar:(char) op {
    operacion = op;
    buffer = entrada;
    entrada = 0.0;
    return entrada;
}


-(double)igual {
    switch (operacion) {
        case '+':
            entrada =  buffer + entrada;
            break;
        case '-':
            entrada = buffer - entrada;
            break;
        case '*':
            entrada = buffer * entrada;
            break;
        case '/':
            if (entrada == 0) {
                if ([self.delegate respondsToSelector:@selector(divisionPorCero)]) {
                    [self.delegate divisionPorCero];
                }
                return 0;
            }
            entrada = buffer / entrada;
            break;
    }
    
    return entrada;
}

@end
