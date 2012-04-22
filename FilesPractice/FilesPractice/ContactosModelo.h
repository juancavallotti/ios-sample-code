//
//  ContactosModelo.h
//  FilesPractice
//
//  Created by Juan Alberto López Cavallotti on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactosModelo : NSObject


-(NSDictionary *) listaContactos;

-(BOOL) agregarContacto:(NSString *) nombre conNacimiento:(NSDate *) nacimiento;

-(BOOL) eliminarContacto:(NSString *) nombre;

@end
