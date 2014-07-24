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
    OONCCompany *newCompany= [OONCCompany createCompanyWithDictionary:companyDictionary];
    [self addCompany:newCompany];
    return newCompany;
}

- (void)addCompany:(OONCCompany *)company
{
    if(!self.allCompanies)
    {
        self.allCompanies = [[NSMutableArray alloc]initWithCapacity:5];
    }
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

- (void)addProduct:(OONCProduct *)product toCompanyName:(NSString *)name
{

    for(OONCCompany *company in self.allCompanies)
    {
        if ([name isEqualToString:company.companyname])
        {
            if(!company.products)
            {
                company.products = [[NSMutableArray alloc]initWithCapacity:5];
            }
            [company.products addObject:product];
        }
    }

}

- (void)deleteProduct:(OONCProduct *)product fromCompanyName:(NSString *)name
{
    for(OONCCompany *company in self.allCompanies)
    {
        if ([name isEqualToString:company.companyname])
        {
            [company.products removeObject:product];
        }
    }

}


@end
