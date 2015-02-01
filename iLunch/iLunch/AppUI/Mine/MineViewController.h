//
//  MineViewController.h
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface MineViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
@protected
    UITableView *_tableView;
    
    NSMutableArray *_menus;
}

@property (nonatomic, strong) NSMutableArray *menus;

@end