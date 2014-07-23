//
//  OONCProduct.h
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OONCProduct : NSObject
@property(nonatomic, strong) NSMutableString *name;
@property(nonatomic, strong) NSMutableString *url;

- (OONCProduct *)initWithDictionary:(NSDictionary*)dictionary;
@end
