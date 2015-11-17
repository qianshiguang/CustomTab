
//
//  SettingTableViewController.m
//  CustomTab
//
//  Created by wei on 15/11/12.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "SettingTableViewController.h"
#import "NV_LoginViewController.h"


@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[tableView cellForRowAtIndexPath:indexPath] setHighlighted:NO];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
        if ([indexPath row] == 2)
        {
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"退出" message:@"确定退出" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alert.tag = 1;
            [alert show];
            return;
        }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {
        if(buttonIndex != [alertView cancelButtonIndex])
        {
            
            [self.navigationController popViewControllerAnimated:YES];
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NV_LoginViewController *viewController = (NV_LoginViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"loginViewController"];
            [self presentViewController:viewController animated:YES completion:nil];
        }
    }
}

@end
