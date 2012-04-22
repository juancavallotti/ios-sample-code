//
//  UrlViewController.h
//  WebView
//
//  Created by Juan Alberto López Cavallotti on 29/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UrlViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray* urls;
@property (strong, nonatomic) NSArray* labels;

@end
