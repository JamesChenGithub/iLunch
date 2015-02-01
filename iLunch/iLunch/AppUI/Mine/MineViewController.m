//
//  MineViewController.m
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MineViewController.h"


@implementation MineViewController

- (void)addBackItem
{
    
}

- (void)viewDidLoad
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    MineLoginView *logView = [[MineLoginView alloc] init];
    logView.backgroundColor = kRedColor;
    [logView setFrameAndLayout:CGRectMake(0, 0, self.view.bounds.size.width, 160)];
    _tableView.tableHeaderView = logView;
}

- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
    __weak typeof(self) ws = self;
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"我的送餐地址" icon:nil action:^(id<MenuAbleItem> menu) {
        AddressManageViewController *msv = [NSObject loadClass:[AddressManageViewController class]];
        msv.title = @"地址管理";
        [[AppDelegate sharedAppDelegate] pushViewController:msv];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"我的订单" icon:nil action:^(id<MenuAbleItem> menu) {
        [ws onSetting];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"我的收藏" icon:nil action:^(id<MenuAbleItem> menu) {
        MyCollectViewController *msv = [NSObject loadClass:[MyCollectViewController class]];
        msv.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:msv];
    }];
    [_menus addObject:item];
    
    
    item = [[MenuItem alloc] initWithTitle:@"我的评论" icon:nil action:^(id<MenuAbleItem> menu) {
        MyCommentViewController *msv = [NSObject loadClass:[MyCommentViewController class]];
        msv.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:msv];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"我的商家入口" icon:nil action:^(id<MenuAbleItem> menu) {
        [ws onSetting];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"我的客服中心" icon:nil action:^(id<MenuAbleItem> menu) {
        [ws onSetting];
    }];
    [_menus addObject:item];
}

- (void)onSetting
{
    MineSettingViewController *msv = [NSObject loadClass:[MineSettingViewController class]];
    [[AppDelegate sharedAppDelegate] pushViewController:msv];
}



- (void)layoutOnIPhone
{
    _tableView.frame = self.view.bounds;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kDefaultCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menus.count;
}

#define kMineTableViewCell @"kMineTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMineTableViewCell];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kMineTableViewCell];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = kMainTextColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MenuItem *item = self.menus[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItem *item = self.menus[indexPath.row];
    [item menuAction];
}

@end
