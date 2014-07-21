//
//  OONCDAO.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCDAO.h"

@implementation OONCDAO

- (OONCProduct *)createProductObject:(NSMutableDictionary *)productDict
{
    NSArray *keys = [[NSArray alloc]initWithArray:[productDict allKeys] copyItems:YES];
    
    return [OONCProduct initWithArray:keys];
//  should also implement  return [OONCProduct initWithDictionary:keys];
}

- (NSMutableDictionary *)getProductObjects
{
    return self.products;
}


- (void)deleteProduct:(OONCProduct *)product
{
    
}



@end
