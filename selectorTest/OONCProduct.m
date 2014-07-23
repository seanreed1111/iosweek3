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
    if(self)
    {
        //do stuff
    }
    
    return self;
}

- (OONCProduct *)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self)
    {
        NSArray *keys = [dictionary allKeys];
 
        //copy objects passed from dictionary into named properties of current object
        for (NSString *property in keys)
        {
            SEL setProperty = NSSelectorFromString([NSString stringWithFormat:@"set%@:",[property capitalizedString]]); //if property names already have a capital letter in them, this won't work. Would need a capitalize first word method.

            if([self respondsToSelector:setProperty])
            {
                [self performSelector:setProperty
                           withObject:[dictionary objectForKey:property]];
            }
        }
    
    }
    return self;
}

+ (OONCProduct *)createWithDictionary:(NSDictionary*)dictionary
{
    OONCProduct *newObj = [[OONCProduct alloc]initWithDictionary:dictionary];
    return newObj;
}

@end