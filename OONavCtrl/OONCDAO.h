//
//  OONCDAO.h
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OONCProduct.h"
#import "OONCCompany.h"

@interface OONCDAO : NSObject
@property (strong, nonatomic) NSMutableDictionary *products;
@property (strong, nonatomic) NSMutableDictionary *companies;
@end
