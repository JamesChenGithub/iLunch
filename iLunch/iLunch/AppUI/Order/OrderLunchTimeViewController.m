//
//  OrderLunchTimeViewController.m
//  iLunch
//
//  Created by James on 15-1-10.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "OrderLunchTimeViewController.h"

@implementation OrderLunchTimeViewController

- (void)addOwnViews
{
    _lunchTimeView = [[LunchTimeSettingView alloc] init];
    [self.view addSubview:_lunchTimeView];
}

- (void)layoutOnIPhone
{
    [_lunchTimeView setFrameAndLayout:self.view.bounds];
}

@end
