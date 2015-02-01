//
//  SellerOrderDetailViewController.h
//  iLunch
//
//  Created by James on 15-1-20.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SellerOrderDetailViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
{
@protected
    UITableView *_tableView;
    
    UIView *_footView;
    UILabel *_footLabel;
}

@end
#endif
