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

@property (strong, nonatomic) NSMutableArray *allCompanies; //of OONCCompany objects

- (OONCProduct *)createProductWithDictionary:(NSDictionary *)productDictionary;

- (OONCCompany *)createCompanyWithDictionary:(NSDictionary *)companyDictionary;

- (void)addCompany:(OONCCompany *)company;
- (void)deleteCompany:(OONCCompany *)company;
- (void)addProduct:(OONCProduct *)product toCompanyName:(NSString *)name; //also make addProduct:(OONCProduct *) toCompany:(OONCCompany*)
- (void)deleteProduct:(OONCProduct *)product fromCompanyName:(NSString *)name;


@end
