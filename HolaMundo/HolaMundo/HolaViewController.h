//
//  HolaViewController.h
//  HolaMundo
//
//  Created by Juan Alberto López Cavallotti on 06/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HolaViewController : UIViewController {
    int atributo;
}

@property (weak, nonatomic) IBOutlet UILabel *etiqueta;
@property (weak, nonatomic) IBOutlet UITextField *campoTexto;

@end
