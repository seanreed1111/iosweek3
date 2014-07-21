//
//  OONCProduct.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCProduct.h"

@implementation OONCProduct


- (OONCProduct *)initWithArray:(NSArray*)array
{
    self = [super init];

    
    return self;
}

+ (OONCProduct *)initWithArray:(NSArray*)array
{
    OONCProduct *newProduct = [[OONCProduct alloc]init];
    
    return newProduct;
}

+ (OONCProduct *)initWithDictionary:(NSDictionary*)array
{
    OONCProduct *newProduct = [[OONCProduct alloc]init];
    
    return newProduct;
}
@end
