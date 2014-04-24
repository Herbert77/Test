//
//  NewsViewController.m
//  Test
//
//  Created by Erkang on 14-3-31.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewController.h"
#import "CCRNewsItemStore.h"
#import "CCRNewsItem.h"
#import "CCRNewsItemCell.h"


@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"达令街"];
        
        
        // Create a new button item that will send addNewItem: to itemsViewController
        UIBarButtonItem *refresh = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                    target:self
                                    action:@selector(refreshItem:)];

        for (int i = 0; i < 5; i++) {
            [[CCRNewsItemStore sharedStore] createItem];
        }
        // Set this bar button item as the right item in the navigation item
        [[self navigationItem] setRightBarButtonItem:refresh];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[CCRNewsItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"CCRNewsItemCell";
    
    CCRNewsItemCell *cell = (CCRNewsItemCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib  = [[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    CCRNewsItem *p = [[[CCRNewsItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    [[cell userName] setText:[p userName]];
    [[cell bookName] setText:[p bookName]];
    [[cell comSummary] setText:[p comSummary]];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
