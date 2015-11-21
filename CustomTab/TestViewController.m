//
//  TestViewController.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "TestViewController.h"
#import "CostomView.h"

#import "CustomButton.h"
@interface TestViewController ()

@property (nonatomic, strong) UITextField* tf;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
//    self.view.alpha = 0.95;
    
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
//    image.alpha = 0.8;
//    image.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    [self.view addSubview:image];
//    self.view.contentMode = UIViewContentModeScaleAspectFit;
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    _tf = [[UITextField alloc] init];
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    _tf.placeholder = @"请输入鸿歌之星";
    // 创建leftView
    CustomButton *leftView = [CustomButton leftView];
    leftView.frame = CGRectMake(0, 0, 120, 44);
    [leftView setImage:[UIImage imageNamed:@"icon_user"] forState:UIControlStateNormal];
    [leftView setTitle:@"设置" forState:UIControlStateNormal];
    [leftView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置leftView
    _tf.leftViewMode = UITextFieldViewModeAlways;
    _tf.leftView = leftView;
    // 添加到self.view
//    [self.view addSubview:_tf];
    self.tf = _tf;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 30, 44, 44);
    [self.view addSubview:btn];
    
    
    
//
//    _password=[[UITextField alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 50)];
//    _password.backgroundColor=[UIColor whiteColor];
//    _password.placeholder=[NSString stringWithFormat:@"Password"];
//    [self.view addSubview:_password];
//    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    CostomView * background = [[CostomView alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 100)];
    [background setBackgroundColor:[UIColor whiteColor]];
    [[background layer] setCornerRadius:5];
    [[background layer] setMasksToBounds:YES];
    [self.view addSubview:background];
    
    _account=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
    _account.backgroundColor=[UIColor greenColor];
    _account.placeholder=[NSString stringWithFormat:@"Email"];
    _account.layer.cornerRadius=5.0;
    [background addSubview:_account];
    
    _password=[[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
    [_account setBackgroundColor:[UIColor whiteColor]];
    _password.placeholder=[NSString stringWithFormat:@"Password"];
    _password.layer.cornerRadius=5.0;
    [background addSubview:_password];
}

- (void)dismissVC
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}
// 布局self.tf
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // frame
    self.tf.frame = CGRectMake(10, 0, self.view.frame.size.width - 10, 44);
    // 相对于self.view居中
    self.tf.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
