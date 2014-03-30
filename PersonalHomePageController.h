//
//  PersonalHomePageController.h
//  Test
//
//  Created by Herbert on 14-3-30.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalHomePageController : UIViewController

@property NSMutableArray *mottos;

@property NSInteger theRow;

@property (weak, nonatomic) IBOutlet UIImageView *userPic;

@property (weak, nonatomic) IBOutlet UILabel *userMotto;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
