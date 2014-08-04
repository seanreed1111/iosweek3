//
//  OONCParentViewController.h
//  OONavCtrl
//
//  Created by Sean Reed on 7/23/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OONCDAO.h"
#import "OONChildViewController.h"

@interface OONCParentViewController : UITableViewController
@property(strong, nonatomic)OONCDAO *dao;
@property(strong, nonatomic)OONChildViewController *childVC;

@end