//
//  SellerFoodListViewController.h
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "KeyValueTableViewController.h"

@interface SellerFoodListViewController : KeyValueTableViewController<SellerFoodSearchViewDelegate>
{
    SellerFoodSearchView *_searchView;
}

@end
#endif
