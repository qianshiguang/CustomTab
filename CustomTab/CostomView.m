//
//  CostomView.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "CostomView.h"

@implementation CostomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context,1);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 5, 50);
    CGContextAddLineToPoint(context,self.frame.size.width-5, 50);
    CGContextClosePath(context);
    [[UIColor blueColor] setStroke];
    CGContextStrokePath(context);
}


@end
