//
//  AppDelegate.m
//  Test
//
//  Created by 胡 传业 on 14-2-24.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import "CCRAppDelegate.h"
#import "MyBooksViewController.h" // 主页 控制器 头文件
#import "SearchBooksViewController.h"  // 添加图书 控制器 头文件
#import "FollowingViewController.h"  // 添加 关注的人 控制器 头文件
#import "AboutViewController.h" // 添加 关于 控制器 头文件
#import "NewsViewController.h" //首页新鲜事




static NSString * const kAPIKey = @"04e0b2ab7ca02a8a0ea2180275e07f9e";
static NSString * const kPrivateKey = @"4275ee2fa3689a2f";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";

@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    DOUService *service = [DOUService sharedInstance];
    service.clientId = kAPIKey;
    service.clientSecret = kPrivateKey;
    
    NSString *subPath = [NSString stringWithFormat:@"/book/subject/%lld", 9787539967448];
    DOUQuery  *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
    
    query.apiBaseUrlString = service.apiBaseUrlString;
    DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];
    
    [service addRequest:req];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 创建新鲜事儿页面
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    UINavigationController *navi_news = [[UINavigationController alloc] initWithRootViewController:newsViewController];
    UITabBarItem *tabBarItem_0 = [[UITabBarItem alloc] initWithTitle:@"动态" image:nil tag:0];
    navi_news.tabBarItem = tabBarItem_0;
    
    // 创建 主页 控制器 并设置 为导航控制器 navi_home 的根视图控制器
    MyBooksViewController *myBooksViewController = [[MyBooksViewController alloc] init];
    UINavigationController *navi_home = [[UINavigationController alloc] initWithRootViewController:myBooksViewController];
    // 创建 第一个 tabBar
    UITabBarItem *tabBarItem_1 = [[UITabBarItem alloc] initWithTitle:@"我的书" image:nil tag:1];
    navi_home.tabBarItem = tabBarItem_1;
    
    
    
    
    // 创建 第二个 ，同上
    FollowingViewController *followingViewController = [[FollowingViewController alloc] init];
    UINavigationController *navi_your = [[UINavigationController alloc] initWithRootViewController:followingViewController];
    
    UITabBarItem *tabBarItem_2 = [[UITabBarItem alloc] initWithTitle:@"关注的人" image:nil tag:2];
    navi_your.tabBarItem = tabBarItem_2;
    
    // 创建  aboutViewController
    AboutViewController *aboutViewController = [[AboutViewController alloc] init];
    UINavigationController *navi_about = [[UINavigationController alloc] initWithRootViewController:aboutViewController];
    
    UITabBarItem *tabBarItem_3 = [[UITabBarItem alloc] initWithTitle:@"关于" image:nil tag:3];
    navi_about.tabBarItem = tabBarItem_3;

    
    NSArray *controllers = @[navi_news, navi_home , navi_your, navi_about];
    
    _tabBarController = [[UITabBarController alloc] init];
    
    [_tabBarController setViewControllers:controllers];
    
    [[self window] setRootViewController:_tabBarController];

    return YES;
}

- (void)requestFinished:(DOUHttpRequest *)req {
    NSError *error = [req error];
    if (!error) {
        DoubanFeedEvent *feed = [[DoubanFeedEvent alloc] initWithData:[req responseData]];
        
    }
}

- (void)requestFailed:(DOUHttpRequest *)req {
    NSLog(@"error");
}


@end
