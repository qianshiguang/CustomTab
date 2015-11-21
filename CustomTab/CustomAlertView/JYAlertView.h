//
//  JYAlertView.h
//  CustomTab
//
//  Created by Jianying Sun on 15/10/28.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, JYAlertActionStyle){
    JYAlertActionStytleDefault,
    JYAlertActionStytleCancle,
    JYAlertActionStytleDestructive,
};

@interface JYAlertAction : NSObject <NSCopying>

+ (instancetype)actionWithTItle:(NSString *)title stytle:(JYAlertActionStyle)stytle handler:(void (^)(JYAlertAction *action))handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) JYAlertActionStyle stytle;
@property (nonatomic,getter=isEnabled) BOOL enabled;

@end
@interface JYAlertView : UIView

@property (nonatomic, weak, readonly) UILabel *titleLable;
@property (nonatomic, weak, readonly) UILabel *messageLabel;

@property (nonatomic, assign) CGFloat alertViewWidth;
@property (nonatomic, assign) CGFloat contentViewSpace;

@property (nonatomic, assign) CGFloat textLabelSpace;
@property (nonatomic, assign) CGFloat textLabelContentViewEdge;

@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat buttonSpace;
@property (nonatomic, assign) CGFloat buttonContentViewEdge;
@property (nonatomic, assign) CGFloat buttonCornerRadius;
@property (nonatomic, strong) UIColor *buttonDefaultBGcolor;
@property (nonatomic, strong) UIColor *buttonCancleBGcolor;
@property (nonatomic, strong) UIColor *buttonDestructiveBGcolor;
@property (nonatomic, strong) UIFont  *buttonFont;


@property (nonatomic, strong) UIColor *textFieldBorderColor;
@property (nonatomic, strong) UIColor *textFieldBackgroudColor;
@property (nonatomic, strong) UIFont  *textFieldFont;
@property (nonatomic, assign) CGFloat textFieldHeight;
@property (nonatomic, assign) CGFloat textFieldEdge;
@property (nonatomic, assign) CGFloat textFieldDorderWidth;
@property (nonatomic, assign) CGFloat textFieldContentViewEdge;

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message;
- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler;
- (void)addAction:(JYAlertAction *)action;







@end
