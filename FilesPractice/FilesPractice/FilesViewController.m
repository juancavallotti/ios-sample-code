//
//  FilesViewController.m
//  FilesPractice
//
//  Created by Juan Alberto López Cavallotti on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FilesViewController.h"

@interface FilesViewController ()

@end

@implementation FilesViewController
@synthesize campoNombre;
@synthesize pickerFecha;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//llamado cuando el usuario acciona return en el campo de texto
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)guardarContacto:(id)sender {
    
    ContactosModelo* modelo = ((TabsController *) self.tabBarController).modelo;
    
    BOOL exito = [modelo agregarContacto:self.campoNombre.text conNacimiento:self.pickerFecha.date];
    
    if (exito) {
        self.campoNombre.text = @"";
        self.pickerFecha.date = [NSDate dateWithTimeIntervalSinceNow:0];
        [self.tabBarController setSelectedIndex:1];
    }
    
}



- (void)viewDidUnload
{
    [self setCampoNombre:nil];
    [self setPickerFecha:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
