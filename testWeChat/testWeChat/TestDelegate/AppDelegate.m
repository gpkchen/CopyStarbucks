//
//  AppDelegate.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/9/5.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "StarGiftCardViewController.h"
#import "StoresViewController.h"
#import "AccountViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong)BaseTabBarViewController   *baseTabBarViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window         = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    //
    [self getRootViewController];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -- Private Method

- (void)getRootViewController {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.title = @"首页";
    StarGiftCardViewController *starGiftCardVC = [[StarGiftCardViewController alloc] init];
    starGiftCardVC.title = @"星礼卡";
    StoresViewController *storesVC = [[StoresViewController alloc] init];
    storesVC.title = @"门店";
    AccountViewController *accountVC = [[AccountViewController alloc] init];
    accountVC.title = @"账户";
    
    self.baseTabBarViewController = [[BaseTabBarViewController alloc] init];
    [self.baseTabBarViewController setViewControllers:@[homeVC,starGiftCardVC,storesVC,accountVC]];
    
    [self.window setRootViewController:self.baseTabBarViewController];
    
}



@end
