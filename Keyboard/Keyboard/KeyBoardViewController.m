//
//  KeyBoardViewController.m
//  Keyboard
//
//  Created by Juan Alberto López Cavallotti on 15/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KeyBoardViewController.h"


@interface KeyBoardViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textArea;
@property (weak, nonatomic) IBOutlet UIToolbar *barraTeclado;


@end

#pragma mark - Implementacion del controlador.

@implementation KeyBoardViewController
@synthesize textArea = _textArea;
@synthesize barraTeclado = _barraTeclado;


- (void)tecladoSeMostro:(NSNotification*) param {
    self.barraTeclado.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(tecladoSeMostro:) 
                                                 name:UIKeyboardWillShowNotification 
    
                                               object:nil];
    
    self.textArea.inputAccessoryView = self.barraTeclado;
    //self.textArea.inputView = self.barraTeclado;
}

- (void)viewDidUnload
{
    [self setTextArea:nil];
    [self setBarraTeclado:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}




- (IBAction)ocultarTeclado:(id)sender {
    [self.textArea resignFirstResponder];
}

- (IBAction)mostrarTeclado:(id)sender {
    [self.textArea becomeFirstResponder];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
