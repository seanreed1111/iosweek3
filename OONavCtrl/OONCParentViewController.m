//
//  OONCParentViewController.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/23/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCParentViewController.h"


@implementation OONCParentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@" (id)initWithStyle:(UITableViewStyle)style");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"\nParentVC viewDidLoad");
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Mobile Device Makers";
    self.dao = [[OONCDAO alloc]init];
    

    NSDictionary *microsoftDictionary = @{@"companyname":@"Microsoft",@"companyurl":@"http://microsoft.com", @"companyimagename":@"microsoft-logo.png",@"ticker":@"MSFT",@"products":@[@"Microsoft Product #1", @"Microsoft Product #2", @"Microsoft Product #3"]};
    NSDictionary *appleDictionary = @{@"companyname":@"Apple",@"companyurl":@"http://apple.com", @"companyimagename":@"apple-logo.jpeg",@"ticker":@"AAPL",@"products":@[@"iPad", @"iPod Touch", @"iPhone"]};
    NSDictionary *nokiaDictionary = @{@"companyname":@"Nokia",@"companyurl":@"http://nokia.com/us-en/phones/", @"companyimagename":@"nokia-logo.jpg", @"ticker":@"NOK",@"products":@[@"Nokia Product #1", @"Nokia Product #2", @"Nokia Product #3"]};
    NSDictionary *samsungDictionary = @{@"companyname":@"Samsung",@"companyurl":@"http://samsung.com/us", @"companyimagename":@"samsung-logo.png",@"ticker":@"005930.KS",@"products":@[@"Samsung Product #1", @"Samsung Product #2", @"Samsung Product #3"]};
    NSDictionary *blackberryDictionary = @{@"companyname":@"Blackberry",@"companyurl":@"http://microsoft.com", @"companyimagename":@"Blackberry-logo.jpg",@"ticker":@"BBRY",@"products":@[@"Blackberry Product #1", @"Blackberry Product #2", @"Blackberry Product #3"]};
    
    
    [self.dao createCompanyWithDictionary:microsoftDictionary];
    [self.dao createCompanyWithDictionary:appleDictionary];
    [self.dao createCompanyWithDictionary:nokiaDictionary];
    [self.dao createCompanyWithDictionary:samsungDictionary];
    [self.dao createCompanyWithDictionary:blackberryDictionary];

}

- (void)didReceiveMemoryWarning
{
    NSLog(@"\nparentVC:didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section");
    // Return the number of rows in the section.

    return [self.dao.allCompanies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
 

    //configure the cell
    OONCCompany *company = [[OONCCompany alloc]init];
    company = [self.dao.allCompanies objectAtIndex:[indexPath row]];
    
    [self asynchGetPriceFromStockTicker:company.ticker];
    cell.textLabel.text = company.companyname;
    cell.imageView.image = [UIImage imageNamed:company.companyimagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    self.childVC = [[OONChildViewController alloc]init];

    
    OONCCompany *company = [[OONCCompany alloc]init];
    company = [self.dao.allCompanies objectAtIndex:[indexPath row]];
    self.childVC.company= company;
    
    self.childVC.title  = [company companyname];
    
    [self.navigationController pushViewController:self.childVC animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath");
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao.allCompanies removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)asynchGetPriceFromStockTicker:(NSString *)ticker
{

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=l1",ticker]];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    
    NSLog(@"asynchGetPriceFromStockSymbol:(NSString*)ticker:%@",ticker);
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"\n(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender");

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"\nconnection: %@ didReceiveResponse",connection);
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!self.receivedData)
    {
        self.receivedData = [[NSMutableData alloc]init];
    }
    [self.receivedData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"\nconnection: %@ didFailWithError: %@ %@",connection,[error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    connection = nil;
    self.receivedData = nil;
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"\nconnection %@DidFinishLoading ",connection);
//    NSLog(@"Final data is %d bytes: %@",[self.receivedData length],self.receivedData);
    NSString *string = [[NSString alloc]initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"\nFinal Data from connection %@ converted to string is %@", connection, string);
    connection = nil;
    self.receivedData = nil;
}
@end
