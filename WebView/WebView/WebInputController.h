//
//  WebInputController.h
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 27/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebInputControllerDelegate <NSObject>

-(void) addedUrl:(NSString *)url withLabel:(NSString *) label;

@end



@interface WebInputController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *campoTitulo;
@property (weak, nonatomic) IBOutlet UITextField *campoUrl;


@property (weak, nonatomic) id<WebInputControllerDelegate> delegate;

@end
