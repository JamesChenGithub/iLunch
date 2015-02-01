//
//  OrderInfoViewController.m
//  iLunch
//
//  Created by James on 15-1-10.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "OrderInfoViewController.h"

@implementation OrderInfoViewController

- (void)addOwnViews
{
    _lunchTime = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft];
    _lunchTime.titleLabel.textAlignment = NSTextAlignmentLeft;
    _lunchTime.titleLabel.font = [UIFont systemFontOfSize:14];
    UIImage *icon = [UIImage imageNamed:@"icon_time.png"];
    _lunchTime.imageSize = icon.size;
    [_lunchTime setImage:icon forState:UIControlStateNormal];
    [_lunchTime setTitle:@"距用餐时间还有：3时45分" forState:UIControlStateNormal];
    [_lunchTime setTitleColor:kMainTextColor forState:UIControlStateNormal];
    _lunchTime.backgroundColor = [UIColor flatWhiteColor];
    [self.view addSubview:_lunchTime];
    
    _orderNum = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft];
    _orderNum.titleLabel.textAlignment = NSTextAlignmentLeft;
    _orderNum.titleLabel.font = [UIFont systemFontOfSize:14];
    icon = [UIImage imageNamed:@"icon_order.png"];
    _orderNum.imageSize = icon.size;
    [_orderNum setImage:icon forState:UIControlStateNormal];
    [_orderNum setTitle:@"订单号：1313341213412341234213" forState:UIControlStateNormal];
    [_orderNum setTitleColor:kMainTextColor forState:UIControlStateNormal];
    _orderNum.backgroundColor = [UIColor flatWhiteColor];
    [self.view addSubview:_orderNum];
    
    _orderFrom = [[UIImageView alloc] init];
    [self.view addSubview:_orderFrom];
    
    _waitTip = [[UILabel alloc] init];
    _waitTip.textAlignment = NSTextAlignmentCenter;
    _waitTip.textColor = kDetailTextColor;
    _waitTip.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_waitTip];
    
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_lunchTime sizeWith:CGSizeMake(bounds.size.width, 44)];
    
    [_orderNum sameWith:_lunchTime];
    [_orderNum layoutBelow:_lunchTime margin:1];
    
    [_orderFrom sizeWith:CGSizeMake(100, 100)];
    [_orderFrom layoutParentHorizontalCenter];
    [_orderFrom layoutBelow:_lunchTime margin:100];
    
    [_waitTip sameWith:_orderNum];
    [_waitTip layoutBelow:_orderFrom margin:25];
}

@end
