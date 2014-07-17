//
//  ChildViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"\nChildViewController: initWithStyle:(UITableViewStyle)style");
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
        NSLog(@"\nChildViewController: viewDidLoad");
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
        NSLog(@"\nChildViewController: viewWillAppear: animated:");
    
    [super viewWillAppear:animated];
    if (!self.dict)
    {
        self.companyImageNames = @[@"apple-logo.jpeg", @"samsung-logo.png", @"Blackberry-logo.jpg", @"microsoft-logo.png", @"nokia-logo.jpg"];
        
        self.companyNames = @[@"Apple Mobile Devices",
                              @"Samsung Mobile Devices",
                              @"Blackberry Mobile Devices",
                              @"Microsoft Mobile Devices",
                              
                              @"Nokia Mobile Devices"
                              ];

        self.productNames = @[@[@"iPad", @"iPod Touch", @"iPhone"],@[@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab"],@[@"Blackberry Product #1", @"Blackberry Product #2", @"Blackberry Product #3"],@[@"Microsoft Product #1", @"Microsoft Product #2", @"Microsoft Product #3"],@[@"Nokia Product #1", @"Nokia Product #2", @"Nokia Product #3"]];
        
        self.dict = [NSDictionary dictionaryWithObjects:self.productNames forKeys:self.companyNames];
        
        self.imageDict = [NSDictionary dictionaryWithObjects:self.companyImageNames forKeys:self.companyNames];
    }
    
    NSLog(@"Dictionary is %@", self.dict);
    
    self.products = [[NSMutableArray alloc ]init];
    self.products = [self.dict objectForKey:self.title]; // self.title was pushed down from parent
    
    NSLog(@"Products are %@", self.products);

    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
        NSLog(@"\nChildViewController: didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        NSLog(@"\nChildViewController:(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView");

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        NSLog(@"\nChildViewController:(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section");

    // Return the number of rows in the section.
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            NSLog(@"\nChildViewController:(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [self.products objectAtIndex:
                           [indexPath row]];
//    cell.imageView.image = [UIImage imageNamed:[self.companyImageNames objectAtIndex:[indexPath row] ]]; //this isn't quite right
    
    cell.imageView.image = [UIImage imageNamed:[self.imageDict objectForKey:self.title]];
    return cell;
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
