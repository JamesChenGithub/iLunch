//
//  TableRefreshViewController.h
//  iLunch
//
//  Created by James on 15-2-5.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ScrollRefreshViewController.h"

@interface TableRefreshViewController : ScrollRefreshViewController<UITableViewDelegate, UITableViewDataSource>
{
@protected
    UITableView                 *_tableView;
}

@property (nonatomic, strong) UITableView *tableView;
// Defaults to YES
@property (nonatomic)BOOL clearsSelectionOnViewWillAppear;

@end
