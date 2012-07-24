//
//  CreateViewController.m
//  CoreDataDemo
//
//  Created by Juan Alberto López Cavallotti on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateViewController.h"
#import "RecordService+Song.h"


@interface CreateViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *artistField;

@end

@implementation CreateViewController
@synthesize titleField = _titleField;
@synthesize artistField = _artistField;
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
    [self setTitleField:nil];
    [self setArtistField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveAction:(id)sender {
    [[RecordService sharedInstance] insertSong:self.titleField.text forArtist:self.artistField.text];
    [self.delegate addedNewRecord];
}

@end
