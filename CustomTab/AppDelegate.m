//
//  AppDelegate.m
//  CustomTab
//
//  Created by Jianying Sun on 15/9/25.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIStoryboard *guideSB = [UIStoryboard storyboardWithName:@"tab1" bundle:[NSBundle mainBundle]];
    UINavigationController *guideNav = guideSB.instantiateInitialViewController;
    UIStoryboard *yuyueSB = [UIStoryboard storyboardWithName:@"tab2" bundle:[NSBundle mainBundle]];
    UINavigationController *yuyueNav = yuyueSB.instantiateInitialViewController;
    UIStoryboard *individualSB = [UIStoryboard storyboardWithName:@"tab3" bundle:[NSBundle mainBundle]];
    UINavigationController *individualNav = individualSB.instantiateInitialViewController;
    UIStoryboard *moreSB = [UIStoryboard storyboardWithName:@"tab4" bundle:[NSBundle mainBundle]];
    UINavigationController *moreNav = moreSB.instantiateInitialViewController;
    tabBarController.viewControllers = @[guideNav,yuyueNav,individualNav,moreNav];
    
    _tabbarViewControllerArray = [[NSMutableArray alloc]initWithArray:tabBarController.viewControllers];

    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.tintColor = self.window.tintColor;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    tabBarItem1.title = @"我的设备";
    tabBarItem2.title = @"好友设备";
    tabBarItem3.title = @"家庭相册";
    tabBarItem4.title = @"更多看家助手";
    tabBarItem1.image = [UIImage imageNamed:@"menu_guide_current"];
    tabBarItem2.image = [UIImage imageNamed:@"menu_yuyue_current"];
    tabBarItem3.image = [UIImage imageNamed:@"menu_individual_current"];
    tabBarItem4.image = [UIImage imageNamed:@"menu_guide_current"];
    [[UITabBar appearance] setBackgroundColor:[UIColor blueColor]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
