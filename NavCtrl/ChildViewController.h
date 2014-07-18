//
//  ChildViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class detailViewController;

@interface ChildViewController : UITableViewController

@property (nonatomic, strong) IBOutlet detailViewController * detailVC;

@property (nonatomic, strong) NSMutableArray *products;

@property (nonatomic, copy) NSArray *companyNames;
@property (nonatomic, copy) NSArray *productNames;
@property (nonatomic, copy) NSArray *companyImageNames;

@property (nonatomic, copy) NSArray *companyURLs;

@property (nonatomic, copy) NSDictionary *imageDict;
@property (nonatomic, copy) NSDictionary *urlDict;
@property (nonatomic, copy) NSMutableDictionary *dict;
@end
