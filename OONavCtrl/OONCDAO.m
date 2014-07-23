//
//  OONCDAO.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCDAO.h"

@implementation OONCDAO
//company-related methods of DAO

- (OONCCompany *)createCompanyWithDictionary:(NSDictionary *)companyDictionary
{
    return [OONCCompany createCompanyWithDictionary:companyDictionary];
}

- (void)addCompany:(OONCCompany *)company
{
    [self.allCompanies addObject:company];
}

- (void)deleteCompany:(OONCCompany *)company
{
    [self.allCompanies removeObject:company];
}


//product related methods of DAO
// add a newly created product to the allProducts array

- (OONCProduct *)createProductWithDictionary:(NSDictionary *)productDictionary
{
    return [OONCProduct createProductWithDictionary:productDictionary];
}

- (void)addProduct:(OONCProduct *) product toCompany:(OONCCompany *) company
{

}

- (void)deleteProduct:(OONCProduct *)product fromCompany:(OONCCompany *)company
{
    
}


@end
