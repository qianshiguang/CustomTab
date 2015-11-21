//
//  NV_HeaderView.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/14.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "NV_HeaderView.h"

@implementation NV_HeaderView

+ (instancetype)headerView{
    
    return [[NSBundle mainBundle]loadNibNamed:@"NV_HeaderView" owner:nil options:nil][0];
}

@end
