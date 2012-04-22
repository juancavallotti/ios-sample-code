//
//  WebViewController.m
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 18/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"
#import "WebAppDelegate.h"
#import "UrlViewController.h"


#define KEY_LABELS @"labels"
#define KEY_URLS @"urls"



@interface WebViewController ()

@property (nonatomic,strong) NSMutableArray* urls;
@property (nonatomic,strong) NSMutableArray* labels;

@end

@implementation WebViewController
@synthesize activityIndicator = _activityIndicator;
@synthesize urlPicker = _urlPicker, urlBar = _urlBar, theWebView = _theWebView, urls = _urls, labels = _labels;

- (void)keyboardShown
{
    [self.urlPicker reloadAllComponents];
    self.urlPicker.hidden = NO;
}


-(void) loadData {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray* urls = [[prefs objectForKey:KEY_URLS] mutableCopy]; 
    NSMutableArray* labels = [[prefs objectForKey:KEY_LABELS] mutableCopy]; 
    
    if (urls && labels) {
        self.urls = urls;
        self.labels = labels;
        return;
    }
    
    self.urls = [[NSArray arrayWithObjects:
                  @"http://www.google.com",
                  @"http://www.twitter.com",
                  @"http://www.facebook.com",
                  nil] mutableCopy];
    
    self.labels = [[NSArray arrayWithObjects:
                    @"Google",
                    @"Twitter",
                    @"Facebook",
                    nil] mutableCopy];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown) name:UIKeyboardWillShowNotification object:nil];
    
    [self loadData];
    
    self.urlPicker.dataSource = self;
    self.urlPicker.delegate = self;
    self.urlBar.inputView = self.urlPicker;
    self.theWebView.delegate = self;
    self.activityIndicator.hidden = YES;
    
    ((WebAppDelegate *)[UIApplication sharedApplication].delegate).urlDelegate = self;
    
    //load the internal page
    NSString *path = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"html"];
    [self.theWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    //[self.theWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}



- (void)viewDidUnload
{
    [self setUrlPicker:nil];
    [self setUrlBar:nil];
    [self setTheWebView:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.urls = nil;
    self.labels = nil;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.urls count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.labels objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    [self.theWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urls objectAtIndex:row]]]];
    self.urlBar.text = [self.urls objectAtIndex:row];
    [self.urlBar resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];    
}

-(void)calledWithUrl:(NSURL *)url {
    //do something interesting
    [self.theWebView stringByEvaluatingJavaScriptFromString:@"doSomething()"];
}



#pragma mark - navegacion

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([@"agregarURL" isEqualToString:segue.identifier]) {
        WebInputController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
    if ([@"administrar" isEqualToString:segue.identifier]) {
        UrlViewController *controller = segue.destinationViewController;
        controller.labels = [self.labels copy];
        controller.urls = [self.urls copy];
    }
    
}


-(void)addedUrl:(NSString *)url withLabel:(NSString *)label {
    [self.urls addObject:url];
    [self.labels addObject:label];
    self.urlPicker.hidden = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.urls forKey:KEY_URLS];
    [defaults setObject:self.labels forKey:KEY_LABELS];
    
    //sync
    [defaults synchronize];
}




@end
