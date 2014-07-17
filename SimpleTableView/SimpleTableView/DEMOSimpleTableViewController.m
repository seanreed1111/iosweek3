//
//  DEMOSimpleTableViewController.m
//  SimpleTableView
//
//  Created by Aditya on 20/10/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOSimpleTableViewController.h"

@implementation DEMOSimpleTableViewController


-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    items = [[NSMutableArray alloc] init];
    for(int i=0;i< 10; i++)
    {
        NSString *data = [[NSString alloc] initWithFormat:@"This is row: %d",i+1];
        [items addObject:data];
    }
    return self;
}

// implements the UITableViewDataSource protocol

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell){
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    [[cell textLabel] setText: [items objectAtIndex:[indexPath row]]];
    [[cell imageView] setImage: [UIImage imageNamed:@"universe-icon.jpg"]];
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = @"Title1";
    return title;
}
@end
