//
//  AppDelegate.m
//  CustomTab
//
//  Created by Jianying Sun on 15/9/25.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "AppDelegate.h"
#import "NV_AdvertisingViewController.h"

#define VC_ISFIRSTTIMELOGO @"vc_isfirsttimelogo"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 /*
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    //    同一个工程中多模块分开写
    
    UIStoryboard *guideSB = [UIStoryboard storyboardWithName:@"tab1" bundle:nil];
    UINavigationController *guideNav = guideSB.instantiateInitialViewController;
    
    UIStoryboard *yuyueSB = [UIStoryboard storyboardWithName:@"tab2" bundle:nil];
    UINavigationController *yuyueNav = yuyueSB.instantiateInitialViewController;
    
    UIStoryboard *individualSB = [UIStoryboard storyboardWithName:@"tab3" bundle:nil];
    UINavigationController *individualNav = individualSB.instantiateInitialViewController;
    
    UIStoryboard *moreSB = [UIStoryboard storyboardWithName:@"tab4" bundle:nil];
    UINavigationController *moreNav = moreSB.instantiateInitialViewController;
    
    tabBarController.viewControllers = @[guideNav,yuyueNav,individualNav,moreNav];

    //一个storyboard中 不连线时 跳转到指定页面
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    
//    NV_DoorbellAcceptViewController *dbvc = (NV_DoorbellAcceptViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"doorbellViewController"];
    UITabBar *tabBar = tabBarController.tabBar;
    
//    tabBar.tintColor = [UIColor colorWithRed:71/255.0 green:168/255.0 blue:222/255.0 alpha:1];
    tabBar.tintColor = [UIColor whiteColor];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.title = @"智能导诊";
    tabBarItem2.title = @"预约医生";
    tabBarItem3.title = @"个人中心";
    tabBarItem4.title = @"更多";
    
//    UIImage* tabBarBackground = [UIImage imageNamed:@"btn_forbid"];
//    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"btn_hover"]];
    UIColor *awoxColor = [UIColor colorWithRed:193/255.0 green:216/255.0 blue:47/255.0 alpha:1.0];
    [[UITabBar appearance] setTintColor:awoxColor];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    [[UIBarButtonItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    //    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"menu_guide_current"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu_guide_default"]];
//    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"menu_yuyue_current"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu_yuyue_default"]];
//    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"menu_individual_current"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu_individual_default"]];
//    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"menu_guide_current"] withFinishedUnselectedImage:[UIImage imageNamed:@"menu_guide_default"]];
    
    tabBarItem1.image = [UIImage imageNamed:@"menu_guide_current"];
    tabBarItem2.image = [UIImage imageNamed:@"menu_yuyue_current"];
    tabBarItem3.image = [UIImage imageNamed:@"menu_individual_current"];
    tabBarItem4.image = [UIImage imageNamed:@"menu_guide_current"];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance] setBackgroundColor:[UIColor blackColor]];
  */
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    
//    if (![[NSUserDefaults standardUserDefaults]valueForKey:VC_ISFIRSTTIMELOGO])
//    {
//        [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithBool:NO] forKey:VC_ISFIRSTTIMELOGO];
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        NV_AdvertisingViewController *viewController = (NV_AdvertisingViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"adviseViewController"];
//        self.window.rootViewController = viewController;
//    }else{
    
        //        UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor lightGrayColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
        [[UIBarButtonItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
         
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
        tabBarItem3.title = @"时光相册";
        tabBarItem4.title = @"智能看家";
        tabBarItem1.image = [UIImage imageNamed:@"menu_guide_current"];
        tabBarItem2.image = [UIImage imageNamed:@"menu_yuyue_current"];
        tabBarItem3.image = [UIImage imageNamed:@"menu_individual_current"];
        tabBarItem4.image = [UIImage imageNamed:@"menu_guide_current"];
        [[UITabBar appearance] setBackgroundColor:[UIColor blueColor]];
//    }

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
