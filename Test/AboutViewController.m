//
//  AboutViewController.m
//  Test
//
//  Created by 胡 传业 on 14-3-2.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutUsViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.navigationController.navigationBarHidden = YES;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark TableView delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 && indexPath.section == 1) {
        AboutUsViewController *aboutUsViewController = [[AboutUsViewController alloc] init];
        [self presentViewController:aboutUsViewController animated:YES completion:nil];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"设置";
    } else {
        return @"其它";
    }
}


#pragma mark -
#pragma mark TableView dataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (section == 0) {
        return 3;
    } else {
        return 2;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"aboutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"个人信息";
            } else if (indexPath.row == 1) {
                cell.textLabel.text = @"消息设置";
            } else {
                cell.textLabel.text = @"账号设置";
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"开发团队";
            } else {
                cell.textLabel.text = @"检查新版本";
            }
            break;
        default:
            break;
    }
    
    // TODO: configure the about's cell
    
    return cell;
    
}




-(IBAction)AboutUsButtonClicked:(id)sender {
    
    NSLog(@"AboutUs is clicked");
    AboutUsViewController *aboutUsViewController = [[AboutUsViewController alloc] init];
    
    [self presentViewController:aboutUsViewController animated:YES completion:nil];
    
}

-(IBAction)SettingsButtonClicked:(id)sender {
    
    NSLog(@"Settings is clicked");
}

@end
