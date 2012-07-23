//
//  ViewController.m
//  TestWebView
//
//  Created by Juan Alberto López Cavallotti on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController
@synthesize webView = _webView;


-(void) didReceiveWebEvent:(NSNotification*) notification
{
    NSLog(@"%@", [notification.userInfo objectForKey:@"url"]);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveWebEvent:) name:kWebEvent object:nil];
    
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:kWebEvent];
}

-(void)viewDidAppear:(BOOL)animated
{
    //NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"www/index" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView stringByEvaluatingJavaScriptFromString:@"doAlert();"];
    NSString* title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"%@", title);
}


/*
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType 
{
    NSLog(@"%@", request.URL);
    
    
    //
    
    
    //return [request.URL.host rangeOfString:@"google"].location != NSNotFound;
    return request.URL.isFileURL;
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
