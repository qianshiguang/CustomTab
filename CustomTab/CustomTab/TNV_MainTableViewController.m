//
//  TNV_MainTableViewController.m
//  CustomTab
//
//  Created by wei on 15/9/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "TNV_MainTableViewController.h"
#import "NV_MoreVCHeaderView.h"
#import "NV_MoreTableViewCell.h"
#import "SXTbvHeaderView.h"
#import "NV_AdvertisingViewController.h"
#import "NV_LoginViewController.h"
#import "SettingTableViewController.h"

#define VC_ISFIRSTTIMELOGO @"vc_isfirsttimelogo"

@interface TNV_MainTableViewController ()

@end

@implementation TNV_MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的摄像机";

    UIBarButtonItem * setbar = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(PushSetVC)];
    self.navigationItem.leftBarButtonItem = setbar;
    
    NV_MoreVCHeaderView *headView = [NV_MoreVCHeaderView headerView];

    self.tableView.tableHeaderView = headView;
    
        if (![[NSUserDefaults standardUserDefaults]valueForKey:VC_ISFIRSTTIMELOGO])
        {
            [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithBool:NO] forKey:VC_ISFIRSTTIMELOGO];
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NV_AdvertisingViewController *viewController = (NV_AdvertisingViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"adviseViewController"];
            [self presentViewController:viewController animated:YES completion:nil];
    
        }
        else
        {
    //        if([[NVSDK3 shared].keyManager isCredentialValid:[[NVSDK3 shared].keyManager loadUserCredential]])
    //        {
    //            // has user credential, could continue ..
    //            self.navigationItem.leftBarButtonItem.enabled = NO;
    //        }
    //        else
    //        {
    //            BOOL isLocal = [[[NSUserDefaults standardUserDefaults]valueForKey:NV_LOGIN_STATUS_ISLOCAL] boolValue];
    //
    //            if (isLocal)
    //            {
    ////                [self OfflineMode];
    //            }
    //            else
    //            {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    NV_LoginViewController *viewController = (NV_LoginViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
    //            }
    //        }
        }

}

- (void)PushSetVC
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Setting" bundle:[NSBundle mainBundle]];
    SettingTableViewController *viewController = (SettingTableViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"SettingTableViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"mainCell";
    NV_MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.iconImage.image = [UIImage imageNamed:@"icon_user"];
    cell.textLabel.text = @"就诊人管理";

    cell.iconGo.image = [UIImage imageNamed:@"icon_go"];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_background_green"]];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return  cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[tableView cellForRowAtIndexPath:indexPath] setHighlighted:NO];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    if ([indexPath section] == 0)
    {
        if ([indexPath row] == 0)
        {
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"退出" message:@"确定退出" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alert.tag = 1;
            [alert show];
            return;
        }
        
        
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {
        if(buttonIndex != [alertView cancelButtonIndex])
        {
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NV_LoginViewController *viewController = (NV_LoginViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"loginViewController"];
            [self presentViewController:viewController animated:YES completion:nil];
        }
    }
}
@end
