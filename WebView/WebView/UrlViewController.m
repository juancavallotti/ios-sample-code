//
//  UrlViewController.m
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UrlViewController.h"

@interface UrlViewController ()

@end

@implementation UrlViewController
@synthesize tableView = _tableView, urls = _urls, labels = _labels;

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
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.toolbarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated {
    self.navigationController.toolbarHidden = YES;    
}

- (IBAction)editMode:(id)sender {
    
    BOOL isEditing = [self.tableView isEditing];
    
    
    
    [self.tableView setEditing:!isEditing animated:YES];
}



#pragma mark - table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //obtener la celda reutilizable.
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"celda"];
    
    //obtener los datos
    NSString* label = [self.labels objectAtIndex:indexPath.row];
    NSString* url = [self.urls objectAtIndex:indexPath.row];
    
    //configurar la celda.
    cell.textLabel.text = label;
    cell.detailTextLabel.text = url;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Deleted");
        [self.tableView setEditing:NO animated:YES];
    }
    
    
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"Mis Direcciones";
            break;
            
        default:
            return @"W T F";
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.labels count];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleInsert;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return NO;
    }
    
    return YES;
}

@end
