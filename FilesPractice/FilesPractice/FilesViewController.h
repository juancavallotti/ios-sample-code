//
//  FilesViewController.h
//  FilesPractice
//
//  Created by Juan Alberto López Cavallotti on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactosModelo.h"
#import "TabsController.h"

@interface FilesViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *campoNombre;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerFecha;

@end
