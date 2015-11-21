//
//  CustomButton.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "CustomButton.h"


#define StarW 30
@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.imageView.contentMode = UIViewContentModeRight;
    self.userInteractionEnabled = NO;
    return  self;
}

+ (instancetype)leftView
{
    return [self buttonWithType:UIButtonTypeCustom];

}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{

    return CGRectMake(StarW, 0, contentRect.size.width - StarW, contentRect.size.height);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, StarW, contentRect.size.height);
}
@end
