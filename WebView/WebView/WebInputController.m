//
//  WebInputController.m
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 27/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebInputController.h"

@interface WebInputController ()

@end

@implementation WebInputController
@synthesize campoTitulo = _campoTitulo;
@synthesize campoUrl = _campoUrl;


@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setCampoTitulo:nil];
    [self setCampoUrl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)agregarNuevaUrl:(id)sender {

    NSString *titulo = self.campoTitulo.text;
    NSString *url = self.campoUrl.text;
    
    //validar que el titulo no se encuentre vacio.
    if (![titulo length]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validacion" 
                                                        message:@"Debe escribir un titulo" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"Aceptar" 
                                              otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if (![url hasPrefix:@"http://"]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validacion" 
                                                        message:@"Debe escribir un titulo" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"Aceptar" 
                                              otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [self.delegate addedUrl:url withLabel:titulo];
    
    self.campoUrl.text = @"";
    self.campoTitulo.text = @"";
    
    [self.campoUrl resignFirstResponder];
    [self.campoTitulo resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
