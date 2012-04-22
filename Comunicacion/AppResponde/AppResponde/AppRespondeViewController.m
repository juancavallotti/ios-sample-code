//
//  AppRespondeViewController.m
//  AppResponde
//
//  Created by Juan Alberto López Cavallotti on 20/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppRespondeViewController.h"
#import "AppRespondeAppDelegate.h"


@interface AppRespondeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textoUrl;

@end

@implementation AppRespondeViewController
@synthesize textoUrl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppRespondeAppDelegate *del = [UIApplication sharedApplication].delegate;
    if (del.urlHost) {
        self.textoUrl.text = del.urlHost;
    } else {
        self.textoUrl.text = @"No me llamaron por url :(";
    }
    
}

- (void)viewDidUnload
{
    [self setTextoUrl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
