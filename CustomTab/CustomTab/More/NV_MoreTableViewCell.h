//
//  NV_MoreTableViewCell.h
//  CustomTab
//
//  Created by wei on 15/9/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NV_MoreTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UIImageView *iconGo;

@property (strong, nonatomic) IBOutlet UIView *lineView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end
