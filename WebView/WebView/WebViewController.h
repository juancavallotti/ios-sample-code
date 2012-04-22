//
//  WebViewController.h
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 18/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrlListenerDelegate.h"
#import "WebInputController.h"

@interface WebViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate,UIWebViewDelegate,UrlListenerDelegate,WebInputControllerDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *urlPicker;
@property (weak, nonatomic) IBOutlet UITextField *urlBar;
@property (weak, nonatomic) IBOutlet UIWebView *theWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
