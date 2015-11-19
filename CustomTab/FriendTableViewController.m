//
//  FriendTableViewController.m
//  CustomTab
//
//  Created by Jianying Sun on 15/10/29.
//  Copyright © 2015年 Netviewtech. All rights reserved.
//

#import "FriendTableViewController.h"

@interface FriendTableViewController ()

@end

@implementation FriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"代码约束的实现";

    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    image.alpha = 0.8;
    self.tableView.backgroundView = image;
    self.tableView.contentMode = UIViewContentModeScaleAspectFit;
    
//    background init and tapped
//    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    background.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
//    background.opaque = NO;
//    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
//    [background addGestureRecognizer:gesture];
//    self.shareBackGroundView = background;
//    
//    self.shareBackGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
//    
//    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [delegate.window addSubview:self.shareBackGroundView];
//    
//    
//    self.shareBackGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
//    [self.shareBackGroundView removeFromSuperview];
}


- (NSArray *)demoTitles
{
    return @[
             @"最基本的约束布局", // Demo 1
             @"与数组的视图一起工作", // Demo 2
             @"多个视图配置", // Demo 3
             @"左对齐", // Demo 4
             @"交叉属性约束", // Demo 5
             @"优先与不平等", // Demo 6
             @"动画约束", // Demo 7
             @"约束的标识符（iOS 7 +）", // Demo 8
             @"布局的利润（如果8.0 +）", // Demo 9
             @"没有安装的约束" // Demo 10
             ];
}


- (NSString *)textForDemoAtIndex:(NSUInteger)index
{
    NSString *text = self.demoTitles[index];
    text = [NSString stringWithFormat:@"%@. %@", @(index + 1), text];
    return text;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return self.demoTitles.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        NSString *language = @"这三个是例子";
        return [NSString stringWithFormat:@"%@ Demos", language];
    } else {
//        NSString *language = self.useSwiftDemos ? @"Swift" : @"Objective-C";
        NSString *language = @"OC语言代码";
        return [NSString stringWithFormat:@"%@ Demos", language];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil]; // not bothering to reuse cells here
    NSString *text;
    if (indexPath.section == 0)
    {
        // The very first section is the option to switch between Objective-C and Swift demo files.
        cell.textLabel.textColor = [UIColor blueColor];
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        NSString *language = @"Swift";
        text = [NSString stringWithFormat:@"Switch to %@ demo files", language];
//        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
//        text = @"你好demos.";
    } else
    {
        // All other rows take you to the actual demos.
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        text = [self textForDemoAtIndex:indexPath.row];
    }
    cell.textLabel.text = text;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        // The very first section is the option to switch between Objective-C and Swift demo files.
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationMiddle];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else
    {
        // All other rows take you to the actual demos.
        [self displayDemoAtIndex:indexPath.row];
    }
}

- (void)displayDemoAtIndex:(NSUInteger)index
{
    NSString *viewControllerClassName;
   
////        viewControllerClassName = [NSString stringWithFormat:@"iOSDemo%@ViewController", @(index + 1)];
//    viewControllerClassName = [NSString stringWithFormat:@"ALiOSDemo%@ViewController", @(index + 1)];
//    Class viewControllerKlass = NSClassFromString(viewControllerClassName);
//    NSAssert(viewControllerKlass, @"Class should not be nil!");
//    NSAssert([viewControllerKlass isSubclassOfClass:[UIViewController class]], @"Class should be a view controller!");
//    UIViewController *demoViewController = [[viewControllerKlass alloc] initWithNibName:nil bundle:nil];
//    if (demoViewController) {
//        demoViewController.title = [self textForDemoAtIndex:index];
//        [self.navigationController pushViewController:demoViewController animated:YES];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


@end
