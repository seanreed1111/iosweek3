//
//  OONCCompany.h
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OONCProduct.h"

@interface OONCCompany : NSObject
@property(copy, nonatomic) NSString *companyname;
@property(copy, nonatomic) NSString *companyurl;
@property(copy, nonatomic) NSString *companyimagename;
@property(copy, nonatomic) NSString *companyimagepath;

@property(strong, nonatomic) NSMutableArray *products; //of OONCProduct objects

+ (OONCCompany *)createCompanyWithDictionary:(NSDictionary *)companyDictionary;

- (OONCCompany *)initCompanyWithDictionary:(NSDictionary*)companyDictionary;

@end

