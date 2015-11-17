//
//  NV_LoginViewController.h
//  mynetvue
//
//  Created by Jianying Sun on 14-8-20.
//  Copyright (c) 2014年 Netview. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef NEED_GOOGLE_ADS
#import <GoogleMobileAds/GoogleMobileAds.h>
#endif

enum TableViewWithType {
    TableViewWithTypeSignIn = 0,
    TableViewWithTypeSignUp = 1,
    TableViewWithTypeRecoverPassword =2
};

@interface NV_LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *logLab;
@property (weak, nonatomic) IBOutlet UITableView *theTableView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *loginAndRegisterButton;
@property (assign, nonatomic) enum TableViewWithType theType;

@property (retain, nonatomic) UITextField *userName;
@property (retain, nonatomic) UITextField *password;
@property (retain, nonatomic) UITextField *password2;
@property (retain, nonatomic) UITextField *email;

@property (unsafe_unretained, nonatomic) BOOL isFromGuideFirstViewController;

#ifdef NEED_GOOGLE_ADS
@property (strong, nonatomic) GADBannerView *adBanner;
#endif

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)signInAndUpButtonPressed:(UIButton *)sender;

@end
