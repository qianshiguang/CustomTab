//
//  NV_GuideFirstViewController.m
//  mynetvue
//
//  Created by dauihi on 15/4/14.
//  Copyright (c) 2015年 Netview. All rights reserved.
//

#import "NV_GuideFirstViewController.h"
#import "AppDelegate.h"
#import "NV_Constants.h"
#import "NV_LoginViewController.h"
#import "NV_MineTableViewController.h"


@interface NV_GuideFirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *logButton;
@property (weak, nonatomic) IBOutlet UIButton *localButton;

@end

@implementation NV_GuideFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainTitleLabel.text = @"123";
    _mainTitleLabel.font = [UIFont boldSystemFontOfSize:20];
    [_logButton setTitle:@"登录" forState:UIControlStateNormal];
    [_localButton setTitle:@"登录2" forState:UIControlStateNormal];
    
    _logButton.layer.cornerRadius = 4.f;
    _localButton.layer.cornerRadius = 4.f;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismiss) name:VC_DISMISS_FIRST_GUIDE object:nil];

}

- (void)dismiss
{
    [self dismissViewControllerAnimated:NO completion:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:VC_DISMISS_ADVISE_GUIDE object:nil];
    }];
}

- (IBAction)logButtonAction:(id)sender
{
    if (_isFromLoginViewController)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        _isFromLoginViewController = NO;
    }
    else
    {
        [self performSegueWithIdentifier:@"modalToLogin" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"modalToLogin"])
    {
        NV_LoginViewController *loginViewController = segue.destinationViewController;
        loginViewController.isFromGuideFirstViewController = YES;
    }
}

- (IBAction)localButtonAction:(id)sender
{
      [self OfflineMode];
}

- (void)OfflineMode
{

    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray:((AppDelegate *)[UIApplication sharedApplication].delegate).tabbarViewControllerArray];
//    ((UITabBarItem *)[tabBarController.tabBar.items objectAtIndex:0]).title  = NSLocalizedString(VC_DETAIL_NEARBYCAMS, nil);
    [tabbarViewControllers removeObjectAtIndex:1];
    [tabbarViewControllers removeObjectAtIndex:1];
    [tabBarController setViewControllers:tabbarViewControllers];    
    [tabBarController setSelectedIndex:0];
    NV_MineTableViewController *myCamerasTableViewController = [((UINavigationController *)[tabBarController.viewControllers objectAtIndex:0]).viewControllers objectAtIndex:0];
    //    [myCamerasTableViewController.addBarButton setTitle:NSLocalizedString(VC_LOGIN_LOGIN, nil)];
//    [NV_MineTableViewController.addBarButton setTitle:NSLocalizedString(VC_LOGIN_LOGIN, nil) forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:VC_DISMISS_ADVISE_GUIDE object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:VC_DISMISS_LOGIN_VIEW_CONTORLLER object:nil];
    }];

}


- (IBAction)logHelpButtonAction:(id)sender
{
//    [[NV_UIUtils getNoticeAlert:NSLocalizedString(VC_GUIDE_ALERT_1, nil)]show];
}

- (IBAction)localHelpButtonAction:(id)sender
{
//    [[NV_UIUtils getNoticeAlert:NSLocalizedString(VC_GUIDE_ALERT_2, nil)] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
