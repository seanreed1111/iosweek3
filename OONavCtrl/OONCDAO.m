//
//  OONCDAO.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCDAO.h"

@implementation OONCDAO

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


//company-related methods of DAO

// add a newly created company to the allCompanies array

- (OONCCompany *)createCompanyWithDictionary:(NSDictionary *)companyDictionary
{
    return [OONCCompany createCompanyWithDictionary:companyDictionary];
}

- (void)addCompany
{
    
}

- (void)deleteCompany:(OONCCompany *)company
{
    
}

@end
