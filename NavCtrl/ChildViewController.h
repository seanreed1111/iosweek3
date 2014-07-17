//
//  ChildViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildViewController : UITableViewController

@property (nonatomic, copy) NSMutableArray *products; // from original version of file
@property (nonatomic, copy) NSArray *companyNames;
@property (nonatomic, copy) NSArray *productNames;
@property (nonatomic, copy) NSArray *companyImageNames;
@property (nonatomic, copy) NSDictionary *dict;
@property (nonatomic, copy) NSDictionary *imageDict;

@end
