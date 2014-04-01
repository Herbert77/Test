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
    


    // 设置 用户头像样式为 圆形
    [cell.Avatar.layer setCornerRadius:CGRectGetHeight([cell.Avatar bounds])/2];
    cell.Avatar.layer.masksToBounds = YES;
    
    cell.Avatar.layer.borderWidth = 1.8;
    
    cell.Avatar.layer.borderColor = [[UIColor colorWithRed:(rand()%255)/255.0 green:(rand()%255)/255.0 blue:(rand()%255)/255.0 alpha:0.4] CGColor];
    
    
    // 设置 用户头像
    
    
    [[cell userName] setText:[p userName]];
    [[cell bookName] setText:[p bookName]];
    [[cell comSummary] setText:[p comSummary]];
    
    return cell;
}

// 设置每个Cell 的高度

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 140;
}


-(void) refreshItem:(id)sender {
    
    // TODO:  realize the refreshItem:
}


@end
