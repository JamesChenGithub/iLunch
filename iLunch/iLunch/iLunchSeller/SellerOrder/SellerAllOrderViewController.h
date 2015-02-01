//
//  SellerAllOrderViewController.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerTodayOrderViewController.h"

@interface SellerAllOrderViewController : SellerTodayOrderViewController<DateSearchBarDelegate>
{
    DateSearchBar *_searchBar;
    CalenDarFloatView *_calendarFloatView;
}

@end
#endif