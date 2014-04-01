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


@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
