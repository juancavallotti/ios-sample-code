//
//  ModeloCalculadora.h
//  Calculadora
//
//  Created by Juan Alberto López Cavallotti on 09/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculadoraDelegate.h"

@interface ModeloCalculadora : NSObject

@property (readonly) double buffer;
@property (readonly) double entrada;

@property (nonatomic,strong) id<CalculadoraDelegate> delegate;

-(double) ingresarNumero: (int) numero;
-(void) limpiar;
-(double) operar:(char) operacion;
-(double) igual;


@end
