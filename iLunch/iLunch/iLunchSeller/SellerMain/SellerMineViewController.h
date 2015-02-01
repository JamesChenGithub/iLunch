//
//  SellerMineViewController.h
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "MineViewController.h"

@interface SellerMineViewController : MineViewController
{
    UIButton *_logout;
}

@end
#endif