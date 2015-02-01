//
//  MineSettingViewController.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface MineSettingViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    UIButton *_logoutButton;
    
    NSMutableArray *_menus;
}

@property (nonatomic, strong) NSMutableArray *menus;

@end
