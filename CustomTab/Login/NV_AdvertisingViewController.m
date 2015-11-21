//
//  NV_AdvertisingViewController.m
//  mynetvue
//
//  Created by dauihi on 15/4/14.
//  Copyright (c) 2015年 Netview. All rights reserved.
//

#import "NV_AdvertisingViewController.h"
#import "NV_GuideFirstViewController.h"
#import "NV_Constants.h"

#define InterfaceOrientation  ([UIApplication sharedApplication].statusBarOrientation)

@interface NV_AdvertisingViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *title4;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *rollScrollView;
@property (strong, nonatomic) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;


@end

@implementation NV_AdvertisingViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (InterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        _image1.contentMode = _image2.contentMode = _image3.contentMode = _image4.contentMode = UIViewContentModeScaleAspectFill;
    }
    else
    {
        _image1.contentMode = _image2.contentMode = _image3.contentMode = _image4.contentMode = UIViewContentModeScaleAspectFit;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _title1.text = @"12343yt";
    [_title1 sizeToFit];
    _title1.lineBreakMode = 0;
    _title1.font = [UIFont boldSystemFontOfSize:16];
    _title2.text = @"12343yt";
    [_title2 sizeToFit];
    _title2.lineBreakMode = 0;
    _title2.font = [UIFont boldSystemFontOfSize:16];
    _title3.text = @"12343yt";
    [_title3 sizeToFit];
    _title3.lineBreakMode = 0;
    _title3.font = [UIFont boldSystemFontOfSize:16];

    _title4.text = @"12343yt";
    [_title4 sizeToFit];
    _title4.lineBreakMode = 0;
    _title4.font = [UIFont boldSystemFontOfSize:16];

    
    _label1.text = @"12343yt";
    [_label1 sizeToFit];
    _label1.lineBreakMode = 0;
    _label1.font = [UIFont systemFontOfSize:15];

    _label2.text = @"12343yt";
    [_label2 sizeToFit];
    _label2.lineBreakMode = 0;
    _label2.font = [UIFont systemFontOfSize:15];

    _label3.text = @"12343yt";
    [_label3 sizeToFit];
    _label3.lineBreakMode = 0;
    _label3.font = [UIFont systemFontOfSize:15];

    _label4.text = @"12343yt";
    [_label4 sizeToFit];
    _label4.lineBreakMode = 0;
    _label4.font = [UIFont systemFontOfSize:15];

    
    [_jumpButton setTitle:@"跳开" forState:UIControlStateNormal];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismiss) name:VC_DISMISS_ADVISE_GUIDE object:nil];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.f
                                                  target:self
                                                selector:@selector(scrollTimer)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer fire];

}

- (void)scrollTimer
{
    int count;
    count = (int)_pageControl.currentPage + 1;
    if (count == 4) {
        count = 0;
    }
    [_rollScrollView scrollRectToVisible:CGRectMake(_rollScrollView.frame.size.width * count, 0, _rollScrollView.frame.size.width, _rollScrollView.frame.size.height) animated:YES];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        _image1.contentMode = _image2.contentMode = _image3.contentMode = _image4.contentMode = UIViewContentModeScaleAspectFill;
    }
    else
    {
        _image1.contentMode = _image2.contentMode = _image3.contentMode = _image4.contentMode = UIViewContentModeScaleAspectFit;
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePage:(id)sender
{
    int page = (int)self.pageControl.currentPage;
    [_rollScrollView scrollRectToVisible:CGRectMake(_rollScrollView.frame.size.width * page, 0, _rollScrollView.frame.size.width, _rollScrollView.frame.size.height) animated:YES];

}

- (IBAction)jumpAction:(id)sender
{
    [self performSegueWithIdentifier:@"jumpToGuide1" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
