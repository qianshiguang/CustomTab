//
//  NV_LoginViewController.m
//  mynetvue
//
//  Created by Jianying Sun on 14-8-20.
//  Copyright (c) 2014年 Netview. All rights reserved.
//

#import "NV_LoginViewController.h"
#import "NV_Constants.h"
#import "NV_UIUtils.h"
#import "AppDelegate.h"
#import "NV_GuideFirstViewController.h"
#import "NV_MineTableViewController.h"


@interface NV_LoginViewController ()
{
    __block BOOL _isDisappeared;
    CGFloat _portraitWidth;
    UIButton *loginButton;
    UIButton *registerButton;
    UIButton *recoverButton;
}

@end

@implementation NV_LoginViewController
@synthesize logLab;
@synthesize theTableView;
@synthesize cancelButton, loginAndRegisterButton;

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _isDisappeared = NO;
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithBool:NO] forKey:NV_LOGIN_STATUS_ISLOCAL];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    _isDisappeared = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (InterfaceOrientation == UIInterfaceOrientationPortrait || InterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        _portraitWidth = SCREEN_WIDTH;
    }
    else
    {
        _portraitWidth = SCREEN_HEIGHT;
    }
    
    self.logLab.text = @"登录";
    self.logLab.font = [UIFont boldSystemFontOfSize:20];
    self.userName = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, _portraitWidth-30, 44)];
    self.userName.borderStyle = UITextBorderStyleNone;
    self.userName.placeholder = @"dfrgthy";
    self.userName.backgroundColor = [UIColor clearColor];
    self.userName.delegate = self;
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.userName.textAlignment = NSTextAlignmentCenter;
    self.userName.keyboardType = UIKeyboardTypeASCIICapable;
    self.userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.userName.autocorrectionType = UITextAutocorrectionTypeNo;
    self.userName.returnKeyType = UIReturnKeyNext;
    self.userName.tag = 100;
    
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, _portraitWidth-30, 44)];
    self.password.borderStyle = UITextBorderStyleNone;
    self.password.placeholder = @"dfrgthy";
    self.password.backgroundColor = [UIColor clearColor];
    self.password.delegate = self;
    self.password.secureTextEntry = YES;
    self.password.keyboardType = UIKeyboardTypeASCIICapable;
    self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.returnKeyType = UIReturnKeyDone;
    self.password.tag = 101;
    
    self.password2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, _portraitWidth-30, 44)];
    self.password2.borderStyle = UITextBorderStyleNone;
    self.password2.placeholder = @"dfrgthy";
    self.password2.backgroundColor = [UIColor clearColor];
    self.password2.delegate = self;
    self.password2.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.password2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.password2.textAlignment = NSTextAlignmentCenter;
    self.password2.keyboardType = UIKeyboardTypeASCIICapable;
    self.password2.secureTextEntry = YES;
    self.password2.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.password2.returnKeyType = UIReturnKeyNext;
    self.password2.tag = 102;
    
    self.email = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, _portraitWidth-30, 44)];
    self.email.borderStyle = UITextBorderStyleNone;
    self.email.placeholder = @"dfrgthy";
    self.email.backgroundColor = [UIColor clearColor];
    self.email.delegate = self;
    self.email.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.email.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.email.textAlignment = NSTextAlignmentCenter;
    self.email.keyboardType = UIKeyboardTypeASCIICapable;
    self.email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.email.autocorrectionType = UITextAutocorrectionTypeNo;
    self.email.returnKeyType = UIReturnKeyDone;
    self.email.tag = 103;
    
    UITapGestureRecognizer *resignTextFieldTapGestrue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToResignTextField)];
    [self.view addGestureRecognizer:resignTextFieldTapGestrue];
    
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];

    [self.loginAndRegisterButton setTitle:@"注册"forState:UIControlStateNormal];
    self.loginAndRegisterButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismiss) name:VC_DISMISS_LOGIN_VIEW_CONTORLLER object:nil];

}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapToResignTextField
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.theType == TableViewWithTypeSignIn)
    {
        if (textField == self.userName)
        {
            [self.password becomeFirstResponder];
        }
        else if (textField == self.password)
        {
            [self.view endEditing:YES];
        }
    }
    else if (self.theType == TableViewWithTypeSignUp)
    {
        if (textField ==  self.userName)
        {
            [ self.password becomeFirstResponder];
        }
        else if(textField ==  self.password)
        {
            [ self.password2 becomeFirstResponder];
        }
        else if (textField ==  self.password2)
        {
            [ self.email becomeFirstResponder];
        }
        else if (textField ==  self.email)
        {
            [self.view endEditing:YES];
        }
    }
    else if (self.theType == TableViewWithTypeRecoverPassword)
    {
        if (textField == self.userName)
        {
            [self.view endEditing:YES];
        }
    }
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = self.theTableView.frame;
    int offset = frame.origin.y + 50+ 200 - (self.view.frame.size.height - 216.0);
    self.view.backgroundColor = [UIColor whiteColor];
    if(offset > 0)
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)cancelButtonPressed:(UIButton *)sender
{
    if (_theType == TableViewWithTypeRecoverPassword)
    {
        self.theType=TableViewWithTypeSignIn;
        [self.loginAndRegisterButton setTitle:@"dfrgthy" forState:UIControlStateNormal];
        
        [self.theTableView reloadData];
    }
    else
    {
        if (_isFromGuideFirstViewController)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            _isFromGuideFirstViewController = NO;
        }
        else
        {
            [self performSegueWithIdentifier:@"presentToFirstGuideIdentifier" sender:nil];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"presentToFirstGuideIdentifier"])
    {
        NV_GuideFirstViewController *guideFirstViewController = segue.destinationViewController;
        guideFirstViewController.isFromLoginViewController = YES;
    }
}

- (void)signInAndUpButtonPressed:(UIButton *)sender
{
    if (_theType == TableViewWithTypeSignIn || _theType == TableViewWithTypeRecoverPassword)
    {
        self.theType=TableViewWithTypeSignUp;
        [self.loginAndRegisterButton setTitle:@"登录"forState:UIControlStateNormal];
        [self.theTableView reloadData];
    }
    else
    {
        self.theType=TableViewWithTypeSignIn;
        [self.loginAndRegisterButton setTitle:@"123" forState:UIControlStateNormal];
        
        [self.theTableView reloadData];
    }

}

#pragma mark - -----------------InterfaceOrientations--
#pragma mark - -----------------

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.theType)
    {
        case TableViewWithTypeSignIn:
            return 2;
        case TableViewWithTypeSignUp:
            return 4;
        case TableViewWithTypeRecoverPassword:
            return 1;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loginCell" forIndexPath:indexPath];
    
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    if (self.theType == TableViewWithTypeSignIn)
    {
        if (indexPath.section == 0)
        {
            if([indexPath row] == 0)
            {
                [cell.contentView addSubview:self.userName];
                
            }
            else if([indexPath row] == 1)
            {
                [cell.contentView addSubview:self.password];
            }
        }
    }
    else if (self.theType == TableViewWithTypeSignUp)
    {
        if (indexPath.section == 0)
        {
            if([indexPath row] == 0)
            {
                [cell.contentView addSubview:self.userName];
            }
            else if([indexPath row] == 1)
            {
                [cell.contentView addSubview:self.password];
            }
            else if([indexPath row] == 2)
            {
                [cell.contentView addSubview:self.password2];
            }
            else if([indexPath row] == 3)
            {
                [cell.contentView addSubview:self.email];
            }
        }
    }
    else if (self.theType == TableViewWithTypeRecoverPassword)
    {
        if (indexPath.section == 0)
        {
            if([indexPath row] == 0)
            {
                [cell.contentView addSubview:self.userName];
            }
        }
    }
     return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        if (_theType == TableViewWithTypeSignIn) return 95;
        else if (_theType == TableViewWithTypeSignUp) return 70;
        else return 90;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        if (self.theType == TableViewWithTypeSignIn)
        {
            UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,90)];
            tempView.backgroundColor=[UIColor clearColor];
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame= CGRectMake(0, 0, self.view.bounds.size.width / 2.f+80, 30);
            button.center = CGPointMake(self.view.bounds.size.width / 2.f, 20);
            button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            SEL buttonSelector;
            buttonSelector = @selector(forgetbuttonPressed:);
            [button setTitle:@"忘记密码" forState:UIControlStateNormal];
            
            [button setTitleColor:self.view.tintColor forState:UIControlStateNormal];
            [button addTarget:self action:buttonSelector forControlEvents:UIControlEventTouchUpInside];
            [tempView addSubview:button];
            
            loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [loginButton addTarget:self action:@selector(doSelectServerAndLogin) forControlEvents:UIControlEventTouchUpInside];
            loginButton.backgroundColor = [UIColor lightGrayColor];
     
            loginButton.enabled = YES;
        
            loginButton.frame = CGRectMake(70, 55, _portraitWidth - 140, 35);
            loginButton.layer.cornerRadius = 4.f;
            [loginButton setTitle:@"登录" forState:UIControlStateNormal];
            [tempView addSubview:loginButton];
            
            return tempView;
        }
        else if (self.theType == TableViewWithTypeRecoverPassword)
        {
            UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
            tempView.backgroundColor=[UIColor clearColor];
            
            UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(20,0,self.view.bounds.size.width - 40 ,44)];
            tempLabel.backgroundColor=[UIColor clearColor];
            tempLabel.shadowColor = [UIColor clearColor];
            tempLabel.shadowOffset = CGSizeMake(0,2);
            tempLabel.numberOfLines=0;
            tempLabel.lineBreakMode=NSLineBreakByWordWrapping;
            tempLabel.font=[UIFont systemFontOfSize:14];
            tempLabel.textAlignment = NSTextAlignmentCenter;
            
            NSString *sectionTitle = @"@frebvgb";
            tempLabel.text = sectionTitle;
            [tempView addSubview:tempLabel];
            
            recoverButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [recoverButton addTarget:self action:@selector(doRecover) forControlEvents:UIControlEventTouchUpInside];
            recoverButton.backgroundColor = [UIColor lightGrayColor];
            recoverButton.enabled = YES;
            recoverButton.frame = CGRectMake(40, 65, _portraitWidth - 80, 35);
            recoverButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            recoverButton.layer.cornerRadius = 4.f;
            [recoverButton setTitle:@"@frebvgb" forState:UIControlStateNormal];
            [tempView addSubview:recoverButton];
            
            return tempView;
        }
        else if (self.theType == TableViewWithTypeSignUp)
        {
            UIView *tempView=[[UIView alloc]init];
            tempView.backgroundColor=[UIColor clearColor];
            registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [registerButton addTarget:self action:@selector(doRegister) forControlEvents:UIControlEventTouchUpInside];
            registerButton.backgroundColor = [UIColor lightGrayColor];
            registerButton.enabled = NO;
            registerButton.frame = CGRectMake(70, 30, _portraitWidth - 140, 35);
            registerButton.layer.cornerRadius = 4.f;
            [registerButton setTitle:@"@frebvgb" forState:UIControlStateNormal];
            [tempView addSubview:registerButton];
            return tempView;
        }
    }
    return nil;
}

- (void)forgetbuttonPressed:(UIButton *)sender
{
    self.theType=TableViewWithTypeRecoverPassword;
    self.theTableView.hidden=NO;
    [self.theTableView reloadData];
}

- (void)doSelectServerAndLogin
{
    [self.view endEditing:YES];
    [self setTabbar];
    [self setAddBarButtonEnable:YES];
    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    [tabBarController setSelectedIndex:0];
    NV_MineTableViewController *myCamerasTableViewController = [((UINavigationController *)[tabBarController.viewControllers objectAtIndex:0]).viewControllers objectAtIndex:0];
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:VC_DISMISS_FIRST_GUIDE object:nil];
        
    }];
}

- (void)setAddBarButtonEnable:(BOOL)enable
{
    UITabBarController *tabBarController = (UITabBarController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController;
    NV_MineTableViewController *myCamerasTableViewController = [((UINavigationController *)[tabBarController.viewControllers objectAtIndex:0]).viewControllers objectAtIndex:0];
}

- (void)setTabbar
{
    UITabBarController *tabBarController = (UITabBarController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController;
    NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray:((AppDelegate *)[UIApplication sharedApplication].delegate).tabbarViewControllerArray];
    [tabBarController setViewControllers:tabbarViewControllers];
    [tabBarController setSelectedIndex:0];
}

- (void) doRegister
{
    
}

- (void) doRecover
{

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
