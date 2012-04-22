//
//  UrlListenerDelegate.h
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 19/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UrlListenerDelegate <NSObject>

-(void) calledWithUrl:(NSURL *) url;

@end
