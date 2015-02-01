//
//  SellerTodayOrderViewController.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SellerTodayOrderViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
{
@protected
    UITableView *_tableView;
    
    UILabel *_footLabel;
}

@end
#endif