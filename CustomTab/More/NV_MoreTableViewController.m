//
//  NV_MoreTableViewController.m
//  CustomTab
//
//  Created by Jianying Sun on 15/9/25.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "NV_MoreTableViewController.h"

@interface NV_MoreTableViewController ()

@end

@implementation NV_MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.title = @"更多";
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    self.tableView.backgroundView = image;
    self.tableView.contentMode = UIViewContentModeScaleAspectFit;
//    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"nav"];
//    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


@end
