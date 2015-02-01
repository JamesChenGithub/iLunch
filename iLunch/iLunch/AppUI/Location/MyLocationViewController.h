//
//  MyLocationViewController.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^AddressHandler)(NSString *address);

@interface MyLocationViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    ScrollIndexView *_header;
    
    UITableView *_tableView;
    
    UIButton *_saveAddress;
}

@property (nonatomic, copy) AddressHandler addressCompletion;

@end
