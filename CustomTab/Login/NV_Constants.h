//
//  NV_Constants.h
//  mynetvue
//
//  Created by Jianying Sun on 14-8-15.
//  Copyright (c) 2014年 Netview. All rights reserved.
//

#define ADD_SELECT_DEVICE @"add_Select_device"
#ifndef mynetvue_NV_Constants_h
#define mynetvue_NV_Constants_h



typedef NS_ENUM(NSInteger,AddCameraType)
{
    AddCameraTypeCamera3,
    AddCameraTypeCamera3old,
    AddCameraTypeCameraPT,
    AddCameraTypeCameraNetVue,
};
//屏幕宽高
#define SCREEN_WIDTH        [NV_UIUtils getScreenSize].width
#define SCREEN_HEIGHT       [NV_UIUtils getScreenSize].height
#define IPHONE_6_SCREEN_WIDTH 375
#define IPHONE_6_PLUS_SCREEN_WIDTH 414


//----------------------------NSUserDefaults--------------------------//

#define VC_ISFIRSTTIMELOGO @"vc_isfirsttimelogo"
//登录方式
#define NV_LOGIN_STATUS_ISLOCAL @"nv_login_status_islocal"
//是否第一次点击回放

//获取设备状态
#define InterfaceOrientation  ([UIApplication sharedApplication].statusBarOrientation)

#define VC_DISMISS_ADVISE_GUIDE @"vc_dismiss_advise_guide"
#define VC_DISMISS_FIRST_GUIDE @"vc_dismiss_first_guide"
#define VC_DISMISS_SECOND_GUIDE @"vc_dismiss_second_guide"
#define VC_DISMISS_LOGIN_VIEW_CONTORLLER @"vc_dismiss_login_view_controller"
#define NOTIFICATION_REFRESH_CANLIST @"refresh cameralist"
#define NV_APP_WILL_ENTER_BACKGROUND @"NV_APP_WILL_ENTER_BACKGROUND"
#define NV_APP_WILL_ENTER_FOREGROUND @"NV_APP_WILL_ENTER_FOREGROUND"
#define NV_ALARM_REFRESH_NOTIFICATION @"NV_ALARM_REFRESH_NOTIFICATION"

#endif
