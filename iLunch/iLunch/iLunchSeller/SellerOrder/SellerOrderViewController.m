//
//  SellerOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerOrderViewController.h"

@interface SellerOrderViewController ()

@end

@implementation SellerOrderViewController

- (void)showTodayOrder
{
    [self replace:_allOrderController withNew:_todayOrderController animations:^{
        [_allOrderController.view fadeOut:0.3 delegate:nil];
        [_todayOrderController.view fadeIn:0.3 delegate:nil];
    }];
    
}

- (void)showAllOrder
{
    
    [self replace:_todayOrderController withNew:_allOrderController animations:^{
        [_todayOrderController.view fadeOut:0.3 delegate:nil];
        [_allOrderController.view fadeIn:0.3 delegate:nil];
    }];
    
}

- (void)addIndex
{
    __weak typeof(self) ws = self;
    MenuItem *today = [[MenuItem alloc] initWithTitle:@"今日订单" icon:nil action:^(MenuItem *menu) {
        [ws showTodayOrder];
    }];
    
    
    MenuItem *all = [[MenuItem alloc] initWithTitle:@"所有订单" icon:nil action:^(MenuItem *menu) {
        [ws showAllOrder];
    }];
    
    
    
    _indexView = [[ScrollIndexView alloc] initWithMenus:@[today, all]];
    [self.view addSubview:_indexView];
    [_indexView addLine];
    
    [_indexView selectIndexOf:0];
}

- (void)addOwnViews
{
    
    
    _todayOrderController = [[SellerTodayOrderViewController alloc] init];
    [self addChild:_todayOrderController];
    
    _allOrderController = [[SellerAllOrderViewController alloc] init];
    [self addChild:_allOrderController];
    
    [self addIndex];
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_indexView sizeWith:CGSizeMake(bounds.size.width, 44)];
    [_indexView relayoutFrameOfSubViews];
    
    _todayOrderController.view.frame = CGRectMake(0, 44, bounds.size.width, bounds.size.height - 44);
    [_todayOrderController layoutSubviewsFrame];
    
    _allOrderController.view.frame = CGRectMake(0, 44, bounds.size.width, bounds.size.height - 44);
    [_allOrderController layoutSubviewsFrame];
    
}

@end
#endif