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

@property (strong, nonatomic) NSMutableArray *allCompanies;

- (OONCProduct *)createProductWithDictionary:(NSDictionary *)productDictionary;
- (void)addProduct:(OONCProduct *) product toCompany:(OONCCompany *) company;
- (void)deleteProduct:(OONCProduct *)product fromCompany:(OONCCompany *)company;


- (OONCCompany *)createCompanyWithDictionary:(NSDictionary *)companyDictionary;
- (void)addCompany;
- (void)deleteCompany:(OONCCompany *)company;
@end
