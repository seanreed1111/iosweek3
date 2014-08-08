//
//  OONCDAO.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/21/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCDAO.h"
#import "OONCCompany.h"

@implementation OONCDAO


+ (NSMutableArray *)sharedCompanies
{
    static NSMutableArray *companies = nil; // NSMutableArray of OONCCompany objects
    if(!companies)
    {
        companies = [OONCDAO loadCompanies];
    }

    return companies;
}

+ (NSMutableArray *)loadCompanies
{
    NSMutableArray *companies = [[NSMutableArray alloc]initWithCapacity:5];
    
    NSDictionary *microsoftDictionary = @{@"companyname":@"Microsoft",@"companyurl":@"http://microsoft.com", @"companyimagename":@"microsoft-logo.png",@"ticker":@"MSFT",@"products":@[@"Microsoft Product #1", @"Microsoft Product #2", @"Microsoft Product #3"]};
    NSDictionary *appleDictionary = @{@"companyname":@"Apple",@"companyurl":@"http://apple.com", @"companyimagename":@"apple-logo.jpeg",@"ticker":@"AAPL",@"products":@[@"iPad", @"iPod Touch", @"iPhone"]};
    NSDictionary *nokiaDictionary = @{@"companyname":@"Nokia",@"companyurl":@"http://nokia.com/us-en/phones/", @"companyimagename":@"nokia-logo.jpg", @"ticker":@"NOK",@"products":@[@"Nokia Product #1", @"Nokia Product #2", @"Nokia Product #3"]};
    NSDictionary *samsungDictionary = @{@"companyname":@"Samsung",@"companyurl":@"http://samsung.com/us", @"companyimagename":@"samsung-logo.png",@"ticker":@"005930.KS",@"products":@[@"Samsung Product #1", @"Samsung Product #2", @"Samsung Product #3"]};
    NSDictionary *blackberryDictionary = @{@"companyname":@"Blackberry",@"companyurl":@"http://microsoft.com", @"companyimagename":@"Blackberry-logo.jpg",@"ticker":@"BBRY",@"products":@[@"Blackberry Product #1", @"Blackberry Product #2", @"Blackberry Product #3"]};
    
    [companies addObject:[OONCCompany createCompanyWithDictionary:microsoftDictionary]];
    [companies addObject:[OONCCompany createCompanyWithDictionary:appleDictionary]];
    [companies addObject:[OONCCompany createCompanyWithDictionary:nokiaDictionary]];
    [companies addObject:[OONCCompany createCompanyWithDictionary:samsungDictionary]];
    [companies addObject:[OONCCompany createCompanyWithDictionary:blackberryDictionary]];
    return companies;
}

+ (void)deleteProductNamed:(NSString *)name fromCompany:(OONCCompany *)company
{
    NSUInteger companyIndex = [[OONCDAO sharedCompanies] indexOfObjectIdenticalTo:company];
    NSUInteger productIndex = [company.products indexOfObjectIdenticalTo:name];
    
    //[OONCDAO sharedCompanies][companyIndex]
}

//+ (void)deleteProductAtIndex:(NSUInteger)productIndex fromCompany:(OONCCompany *)company
//{
//    
//}
@end
