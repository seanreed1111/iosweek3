//
//  qcdDemoViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "qcdDemoViewController.h"
#import "ChildViewController.h"

@interface qcdDemoViewController ()

@end

@implementation qcdDemoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"initWithStyle:(UITableViewStyle)style");
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSLog(@"viewDidLoad");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.companyList = [[NSArray alloc]
                       initWithObjects:@"Apple Mobile Devices",
                       @"Samsung Mobile Devices", @"Blackberry Mobile Devices",@"Microsoft Mobile Devices",@"Nokia Mobile Devices",nil];
    self.companyImageNames = @[@"apple-logo.jpeg", @"samsung-logo.png", @"Blackberry-logo.jpg", @"microsoft-logo.png", @"nokia-logo.jpg"];

    self.title = @"Mobile device makers";
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        NSLog(@"numberOfSectionsInTableView:(UITableView *)tableView");

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
            NSLog(@"tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section");

    // Return the number of rows in the section.
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [self.companyList objectAtIndex:
     [indexPath row]];
    
    cell.imageView.image = [UIImage imageNamed:[self.companyImageNames objectAtIndex:[indexPath row] ]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected ChildView - now push the proper view to application - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath");
    
    
    self.childVC.title = self.companyList[indexPath.row];
    
    [self.navigationController
     pushViewController:self.childVC
     animated:YES];
    
}

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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

- (void)didReceiveMemoryWarning
{
    NSLog(@"didReceiveMemoryWarning called");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
