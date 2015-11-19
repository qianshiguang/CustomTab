//
//  NV_MineTableViewController.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/14.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "NV_MineTableViewController.h"
#import "NV_HeaderView.h"
#import "NV_AdvertisingViewController.h"
#import "NV_LoginViewController.h"
#import "UIView+TYAlertView.h"
#import "TestViewController.h"

//#import "TYAlertController+BlurEffects.h"
//#import "SettingModelView.h"
//#import "ShareView.h"



#define VC_ISFIRSTTIMELOGO @"vc_isfirsttimelogo"

@interface NV_MineTableViewController ()

@end

@implementation NV_MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的设备";
    NV_HeaderView *tbvHeader = [NV_HeaderView headerView];
    self.tableView.tableHeaderView = tbvHeader;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[tableView cellForRowAtIndexPath:indexPath] setHighlighted:NO];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
      if ([indexPath section] == 0)
      {
          if ([indexPath row] == 0)
          {
//              UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"退出" message:@"确定退出" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//              alert.tag = 1;
//              [alert show];
//              return;
              
              TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"自定义的提示框" message:@"请重新登录app "];
              
              [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
                  NSLog(@"%@",action.title);
              }]];
              
              [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
                  NSLog(@"%@",action.title);
              }]];
              
              [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                  textField.placeholder = @"请输入账号";
              }];
              [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                  textField.placeholder = @"请输入密码";
              }];
              
              // first way to show
              TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];
//              alertController.alertViewOriginY = 60;
              [self presentViewController:alertController animated:YES completion:nil];
              
              // second way ,use UIView Category
//              [alertView showInController:self preferredStyle:TYAlertControllerStyleAlert];
          }
        else if ([indexPath row] == 1)
        {
            
            TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"菜单选项" message:@""];
            [alertView addAction:[TYAlertAction actionWithTitle:@"设置" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
                NSLog(@"%@",action.title);
            }]];
            [alertView addAction:[TYAlertAction actionWithTitle:@"分享" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
                NSLog(@"%@",action.title);
            }]];
            [alertView addAction:[TYAlertAction actionWithTitle:@"报警" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
                NSLog(@"%@",action.title);
            }]];
            
//            [alertView addAction:[TYAlertAction actionWithTitle:@"删除" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
//                NSLog(@"%@",action.title);
//            }]];
            [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
                NSLog(@"%@",action.title);
            }]];
            
            TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
            [self presentViewController:alertController animated:YES completion:nil];
        
        }
        else if ([indexPath row] == 2)
        {
            
            TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"注意" message:@"打开回放功能是需要收费的 "];
            
            [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
                NSLog(@"%@",action.title);
            }]];
            
            TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationDropDown];
            [self presentViewController:alertController animated:YES completion:nil];
            
            // or show,use UIView Category
//            [alertView showInController:self preferredStyle:TYAlertControllerStyleAlert];
        
        }
    }
    else if ([indexPath section] == 1)
    {
        if ([indexPath row] == 0) {
            
            TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"注意" message:@"确定退出应用程序"];
            
            [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancle handler:^(TYAlertAction *action) {
                
            }]];
            
            [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
                UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                NV_LoginViewController *viewController = (NV_LoginViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"loginViewController"];
                [self presentViewController:viewController animated:YES completion:nil];

                
            }]];
            
            // first way to show ,use UIView Category
//            [alertView showInWindowWithOriginY:200 backgoundTapDismissEnable:YES];
            // second way to show
            [TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];

        }else
        {
            TestViewController *testVC = [[TestViewController alloc]init];
            [self presentViewController:testVC animated:YES completion:^{
                testVC.view.superview.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
//                testVC.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
            }];
        }    
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return  20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
