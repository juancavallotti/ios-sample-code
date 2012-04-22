//
//  HolaViewController.m
//  HolaMundo
//
//  Created by Juan Alberto López Cavallotti on 06/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HolaViewController.h"

@implementation HolaViewController
@synthesize etiqueta;
@synthesize campoTexto;



- (IBAction)holaMundo:(id)sender {
    
    //self.etiqueta.text = @"Hola Mundo!";
    self.etiqueta.text = self.campoTexto.text;
}




- (void)viewDidUnload
{
    [self setEtiqueta:nil];
    [self setCampoTexto:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
