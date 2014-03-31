//
//  CCRNewsItemsViewController.m
//  CharingCrossRoad
//
//  Created by Erkang on 14-3-16.
//  Copyright (c) 2014年 Erkang. All rights reserved.
//

#import "CCRNewsItemsViewController.h"
#import "CCRNewsItemStore.h"
#import "CCRNewsItem.h"
#import "CCRNewsItemCell.h"


@interface CCRNewsItemsViewController ()

@end

@implementation CCRNewsItemsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    UINavigationItem *n = [self navigationItem];
    [n setTitle:@"达令街"];
    
    
    // Create a new button item that will send addNewItem: to itemsViewController
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                            target:self
                            action:@selector(refreshItem:)];
    
    // Set this bar button item as the right item in the navigation item
    [[self navigationItem] setRightBarButtonItem:refresh];

    
    if (self) {
        
        for (int i = 0; i < 5; i++) {
            [[CCRNewsItemStore sharedStore] createItem];
        }
            }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[CCRNewsItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        // CCRNewsItemCell
    
    static NSString *identifier = @"CCRNewsItemCell";
    
    CCRNewsItemCell *cell = (CCRNewsItemCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib  = [[NSBundle mainBundle] loadNibNamed:@"CCRNewsItemCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    CCRNewsItem *p = [[[CCRNewsItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
//    UINib *nib = [UINib nibWithNibName:@"CCRNewsItemCell" bundle:nil];
    
//    [[self tableView] registerNib:nib forCellReuseIdentifier:@"NewsItemCell"];

    [[cell userName] setText:[p userName]];
    [[cell bookName] setText:[p bookName]];
    [[cell comSummary] setText:[p comSummary]];
    
    return cell;
}

@end
