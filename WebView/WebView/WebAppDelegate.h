//
//  WebAppDelegate.h
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 18/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrlListenerDelegate.h"

@interface WebAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) id <UrlListenerDelegate> urlDelegate;

@end
