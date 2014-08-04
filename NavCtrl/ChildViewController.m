//
//  ChildViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ChildViewController.h"
#import "detailViewController.h"

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
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (!self.dict)
    {
        self.companyImageNames = @[@"apple-logo.jpeg", @"samsung-logo.png", @"Blackberry-logo.jpg", @"microsoft-logo.png", @"nokia-logo.jpg"];
        
        self.companyURLs = @[@"http://apple.com",@"http://www.samsung.com/us/",@"http://us.blackberry.com/",@"http://www.windowsphone.com/en-US",@"http://www.nokia.com/us-en/phones/"];
        
        
        self.companyNames = @[@"Apple Mobile Devices",
                              @"Samsung Mobile Devices",
                              @"Blackberry Mobile Devices",
                              @"Microsoft Mobile Devices",
                              
                              @"Nokia Mobile Devices"
                              ];
        
        self.productNames = @[@[@"iPad", @"iPod Touch", @"iPhone"],@[@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab"],@[@"Blackberry Product #1", @"Blackberry Product #2", @"Blackberry Product #3"],@[@"Microsoft Product #1", @"Microsoft Product #2", @"Microsoft Product #3"],@[@"Nokia Product #1", @"Nokia Product #2", @"Nokia Product #3"]];
        
        self.dict = [NSMutableDictionary dictionaryWithObjects:self.productNames forKeys:self.companyNames];
        
        self.imageDict = [NSDictionary dictionaryWithObjects:self.companyImageNames forKeys:self.companyNames];
        
        self.urlDict = [NSDictionary dictionaryWithObjects:self.companyURLs forKeys:self.companyNames];
    }

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
        NSLog(@"\nChildViewController: viewWillAppear: animated:");
    
    [super viewWillAppear:animated];
    
    self.products = [[NSMutableArray alloc ]init];
    
    //this line is the problem
    //it must be giving me an nsarray!
    
    [self.products addObjectsFromArray:[self.dict objectForKey:self.title]];
    
    NSLog(@"\nThere are %d products loaded", [self.products count]);
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
        NSLog(@"\nChildViewController:(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section");

    // Return the number of rows in the section.
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            NSLog(@"\nChildViewController:(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];

    
    cell.imageView.image = [UIImage imageNamed:[self.imageDict objectForKey:self.title]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\nChildViewController:(UITableView *)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath");
    
    if(!self.detailVC)
    {
        self.detailVC = [[detailViewController  alloc]init];
    }
    self.detailVC.title = [self.urlDict objectForKey:self.title];
    
    
    NSLog(@"\n\nTitle of next screen will be %@", self.detailVC.title);
    
    // Pass the selected object to the new view controller.
    
    [self.navigationController pushViewController:self.detailVC animated:YES];


}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\nChildViewController:tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath");
    // Return NO if you do not want the specified item to be editable.
    
    
    return YES;
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\nChildViewController:tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath");
    return YES;
}


// Support editing/deleting the table view.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\nChildViewController:tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath");
    
    NSLog(@"\nIndexPath is %@", indexPath);
    
    NSLog(@"\n[IndexPath length] is %d", [indexPath length]);
        NSLog(@"\n[IndexPath row] is %d", [indexPath row]);
    NSLog(@"\n self.products is %@", self.products);
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        if(self.products)
        {
            [self.products removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation
{
    NSLog(@"\n indexPaths is %@",[indexPaths description]);
    NSLog(@"\n UITableViewRowAnimation variable enum default is %d", animation);
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
        NSLog(@"\nChildViewController:tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath");
}



@end
