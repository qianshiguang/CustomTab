//
//  NV_UIUtils.m
//  mynetvue
//
//  Created by Jianying Sun on 14-8-15.
//  Copyright (c) 2014年 Netview. All rights reserved.
//

#import "NV_UIUtils.h"
#import "NV_Constants.h"
#import "SystemConfiguration/CaptiveNetwork.h"
#import <CommonCrypto/CommonDigest.h>

#ifdef NEED_GOOGLE_ADS
#import <AdSupport/AdSupport.h>
#endif

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/types.h>

#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

#define NV_LOCAL_KEY_UDID @"UDID"
#define kMagnification 2

@implementation NV_UIUtils

+ (CGSize) getScreenSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


@end
