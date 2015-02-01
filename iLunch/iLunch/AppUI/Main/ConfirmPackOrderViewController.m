//
//  ConfirmPackOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-17.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ConfirmPackOrderViewController.h"

@implementation ConfirmPackOrderViewController

- (void)onPay:(UIButton *)but
{
    OrderInfoViewController *book = [[PackOrderInfoViewController alloc] init];
    [[AppDelegate sharedAppDelegate] pushViewController:book];
}
@end
