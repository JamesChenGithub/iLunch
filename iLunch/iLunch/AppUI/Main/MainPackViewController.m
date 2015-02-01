//
//  MainPackViewController.m
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MainPackViewController.h"

@implementation MainPackViewController

- (void)configOwnViews
{
    _shoppingCart.orderAction = ^(id<MenuAbleItem> item){
        ConfirmOrderViewController *info = [[ConfirmPackOrderViewController alloc] init];
        [[AppDelegate sharedAppDelegate] pushViewController:info];
    };
}

@end
