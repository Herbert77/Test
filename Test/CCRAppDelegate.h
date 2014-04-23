//
//  AppDelegate.h
//  Test
//
//  Created by 胡 传业 on 14-2-24.
//  Copyright (c) 2014年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libDoubanAPIEngine/DOUService.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, DOUHttpRequestDelegate>

@property (strong, nonatomic) UIWindow *window;

@property UITabBarController *tabBarController;

@end
