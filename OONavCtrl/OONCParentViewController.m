//
//  OONCParentViewController.m
//  OONavCtrl
//
//  Created by Sean Reed on 7/23/14.
//  Copyright (c) 2014 seanreed.test. All rights reserved.
//

#import "OONCParentViewController.h"
#import "OONCDAO.h"

@implementation OONCParentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Mobile Device Makers";
    OONCDAO *dao = [[OONCDAO alloc]init];
    
    NSDictionary *microsoftDictionary = @{@"companyname":@"Microsoft",@"companyurl":@"http://microsoft.com", @"companyimagename":@"microsoft-logo.png", @"products":@[@"Microsoft Product #1", @"Microsoft Product #2", @"Microsoft Product #3"]};
    NSDictionary *appleDictionary = @{@"companyname":@"Apple",@"companyurl":@"http://apple.com", @"companyimagename":@"apple-logo.jpeg",@"products":@[@"iPad", @"iPod Touch", @"iPhone"]};
    NSDictionary *nokiaDictionary = @{@"companyname":@"Nokia",@"companyurl":@"http://nokia.com/us-en/phones/", @"companyimagename":@"nokia-logo.jpg", @"products":@[@"Nokia Product #1", @"Nokia Product #2", @"Nokia Product #3"]};
    NSDictionary *samsungDictionary = @{@"companyname":@"Samsung",@"companyurl":@"http://samsung.com/us", @"companyimagename":@"samsung-logo.png",@"products":@[@"Samsung Product #1", @"Samsung Product #2", @"Samsung Product #3"]};
    NSDictionary *blackberryDictionary = @{@"companyname":@"Blackberry",@"companyurl":@"http://microsoft.com", @"companyimagename":@"blackberry-logo.png",@"products":@[@"Blackberry Product #1", @"Blackberry Product #2", @"Blackberry Product #3"]};
    
    
    [dao createCompanyWithDictionary:microsoftDictionary];
    [dao createCompanyWithDictionary:appleDictionary];
    [dao createCompanyWithDictionary:nokiaDictionary];
    [dao createCompanyWithDictionary:samsungDictionary];
    [dao createCompanyWithDictionary:blackberryDictionary];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
