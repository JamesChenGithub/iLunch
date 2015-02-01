//
//  SellerRegistViewController.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SellerRegistViewController : BaseTableBottomViewController
{
    UILabel *_service;
    ImageTitleButton *_addEdit;
    
    UITableView *_serviceTableView;
}

@end
#endif
