//
//  NV_MoreTableViewController.m
//  CustomTab
//
//  Created by Jianying Sun on 15/9/25.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "NV_MoreTableViewController.h"
#import "NV_MoreTableViewCell.h"
#import "SXTbvHeaderView.h"
#import "NV_LoginViewController.h"


@interface NV_MoreTableViewController ()

@end

@implementation NV_MoreTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"bar_background_green"];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    self.title = @"设置";
    self.tableView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    SXTbvHeaderView *headView = [SXTbvHeaderView headerView];
    self.tableView.tableHeaderView = headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 3;
        }
            break;
        case 1:
        {
            return 2;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"";
    if ([indexPath section] == 0)
    {
        CellIdentifier = @"moreCell";

    }else
    {
        CellIdentifier = @"moreCell";
    }
    NV_MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if ([indexPath section] == 0)
    {
        switch ([indexPath row])
        {
            case 0:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_order"];
                cell.textLabel.text = @"我的预约";
            }
                break;

            case 1:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_evaluation"];
                cell.textLabel.text = @"我的评价";

            }
                break;
            case 2:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_notice"];
                cell.textLabel.text = @"我的通知";

            }
                break;
            case 3:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_notice"];
                cell.textLabel.text = @"我的通知";
                
            }
                break;
                
            default:
                break;
        }
    }else
    {
        switch ([indexPath row])
        {
            case 0:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_user"];
                cell.textLabel.text = @"就诊人管理";

            }
                break;
            case 1:
            {
                cell.iconImage.image = [UIImage imageNamed:@"icon_set"];
                cell.textLabel.text = @"设置";

            }
                break;
            default:
                break;
        }
    }
    cell.iconGo.image = [UIImage imageNamed:@"icon_go"];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_background_green"]];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return  cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 0)
//    {
//        return 150;
//    }
//    return 0;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (section == 0)
//    {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 150)];
//        UIImageView *bgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
//        bgImage.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 150);
//        [view addSubview:bgImage];
//        return view;
//    }
//    return nil;
//}

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
