//
//  NV_MoreVCHeaderView.m
//  CustomTab
//
//  Created by wei on 15/9/30.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "NV_MoreVCHeaderView.h"

@implementation NV_MoreVCHeaderView

+ (instancetype)headerView{
    return [[NSBundle mainBundle]loadNibNamed:@"NV_MoreVCHeaderView" owner:nil options:nil][0];

}


@end
