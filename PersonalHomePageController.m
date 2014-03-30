//
//  PersonalHomePageController.m
//  Test
//
//  Created by Herbert on 14-3-30.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "PersonalHomePageController.h"

@interface PersonalHomePageController () 

@end

@implementation PersonalHomePageController

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
    
    _mottos = [[NSMutableArray alloc] initWithObjects:@"不积跬步，无以至千里；不积小流，无以成江海。",@"太阳照亮人生的路，月亮照亮心灵的路。",@"读一书，增一智。",@"不吃饭则饥，不读书则愚。", nil];
    
    self.userMotto.text = [_mottos objectAtIndex:self.theRow];
    
    self.userPic.image = [UIImage imageNamed:[NSString stringWithFormat:@"user_%i", (int)self.theRow+1]];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
