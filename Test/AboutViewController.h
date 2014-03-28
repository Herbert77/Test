//
//  AboutViewController.h
//  Test
//
//  Created by 胡 传业 on 14-3-2.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *AboutUs;

@property (weak, nonatomic) IBOutlet UIButton *Settings;

-(IBAction)AboutUsButtonClicked:(id)sender;

-(IBAction)SettingsButtonClicked:(id)sender;

@end
