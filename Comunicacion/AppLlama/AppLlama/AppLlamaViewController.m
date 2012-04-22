//
//  AppLlamaViewController.m
//  AppLlama
//
//  Created by Juan Alberto López Cavallotti on 20/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppLlamaViewController.h"

@interface AppLlamaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *campoEntrada;

@end

@implementation AppLlamaViewController
@synthesize campoEntrada;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCampoEntrada:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)enviarMensaje:(id)sender {
    
    NSString* urlS = [@"responde://" stringByAppendingString:self.campoEntrada.text];
    NSURL *url = [NSURL URLWithString:urlS];
    BOOL couldOpen = [[UIApplication sharedApplication] openURL:url];
    
    if (!couldOpen) {
        //no pude abrir la url
        NSLog(@"Nadie responde");
    }
}

@end
