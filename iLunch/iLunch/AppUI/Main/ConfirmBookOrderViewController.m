//
//  ConfirmBookOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-17.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ConfirmBookOrderViewController.h"

@implementation ConfirmBookOrderViewController

- (void)onPay:(UIButton *)but
{
    OrderInfoViewController *book = [[BookOrderInfoViewController alloc] init];
    [[AppDelegate sharedAppDelegate] pushViewController:book];
}
@end
