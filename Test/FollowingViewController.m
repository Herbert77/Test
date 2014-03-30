//
//  FollowingViewController.m
//  Test
//
//  Created by 胡 传业 on 14-2-27.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "FollowingViewController.h"
#import "UserCell.h"

#import "PersonalHomePageController.h"

@interface FollowingViewController () {
    
    NSMutableArray *nameOfUsers;
    NSMutableArray *latestNews;
    
}

@end

@implementation FollowingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    nameOfUsers = [[NSMutableArray alloc] initWithObjects:@"夏末的雨",@"再见 明天",@"桃花石上书生",@"山吹茶", nil];
    latestNews = [[NSMutableArray alloc] initWithObjects:@"发表了一条新笔记",@"最近添加了《资治通鉴》",@"赞了《纸牌屋》", @"发表了最新评论", nil];
    
    [[self navigationItem] setTitle:[NSString stringWithFormat:@"关注(%i)",[nameOfUsers count]]];
}

#pragma mark - 
#pragma mark UITableView dataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"UserCell";
    
    UserCell *cell = (UserCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    // 圆角矩形  效果
    [cell.imageView.layer setCornerRadius:CGRectGetHeight([cell.imageView bounds]) / 2];
    cell.imageView.layer.masksToBounds = YES;
    
    cell.imageView.layer.borderWidth = 1.8;
    cell.imageView.layer.borderColor = [[UIColor colorWithRed:95/255.0 green:194/255.0 blue:158/255.0 alpha:0.4] CGColor];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_backgroundImage_2.png"]];

    cell.backgroundView = bgImageView;
    
    // 内容
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"user_%i.png", (int)indexPath.row + 1]];
   
    cell.name.text = [nameOfUsers objectAtIndex:indexPath.row];
    
    cell.latestNews.text = [latestNews objectAtIndex:indexPath.row];
    
    
    return cell;
    
}

#pragma mark - 
#pragma mark UITableView delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonalHomePageController *personalHomePageController = [[PersonalHomePageController alloc] init];
    
    personalHomePageController.theRow = indexPath.row;
    
    [[self navigationController] pushViewController:personalHomePageController animated:YES];
    
    
}

@end
