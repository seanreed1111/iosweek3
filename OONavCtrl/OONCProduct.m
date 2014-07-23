//
//  OONCProduct.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCProduct.h"

@implementation OONCProduct

//designated initializer
- (OONCProduct *)initWithDictionary:(NSDictionary*)productDictionary
{
    self = [super init];
    if (self)
    {
        NSArray *keys = [productDictionary allKeys];
        
        //copy objects passed from dictionary into named properties of current object
        for (NSString *property in keys)
        {
            SEL setProperty = NSSelectorFromString([NSString stringWithFormat:@"set%@:",[property capitalizedString]]);
            //if property names already have a capital letter in them, this won't work.
            //Would need a 'capitalize first word only' method.
            
            if([self respondsToSelector:setProperty])
            {
                [self performSelector:setProperty
                           withObject:[productDictionary objectForKey:property]];
            }
        }
        
    }
    return self;
}

+ (OONCProduct *)createWithDictionary:(NSDictionary*)productDictionary
{
    OONCProduct *newObj = [[OONCProduct alloc]initWithDictionary:productDictionary];
    return newObj;
}
@end