//
//  DiscoveryViewController.h
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface DiscoveryViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
}


@end
