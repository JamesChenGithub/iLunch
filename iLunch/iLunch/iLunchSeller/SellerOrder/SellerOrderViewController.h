//
//  SellerOrderViewController.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SellerOrderViewController : BaseViewController
{
    ScrollIndexView *_indexView;
    BaseViewController *_todayOrderController;
    BaseViewController *_allOrderController;
}

@end
#endif