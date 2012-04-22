//
//  TabsController.m
//  FilesPractice
//
//  Created by Juan Alberto López Cavallotti on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TabsController.h"

@interface TabsController ()

@end

@implementation TabsController

@synthesize modelo = _modelo;


//inicializacion tardia
-(ContactosModelo *) modelo {
    if (!_modelo) {
        _modelo = [[ContactosModelo alloc] init];
    }
    return _modelo;
}

@end
