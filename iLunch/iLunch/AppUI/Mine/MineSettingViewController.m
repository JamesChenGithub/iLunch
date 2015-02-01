//
//  MineSettingViewController.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MineSettingViewController.h"


@implementation MineSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"设置";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _logoutButton = [[UIButton alloc] init];
    [_logoutButton setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_logoutButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logoutButton addTarget:self action:@selector(onLogout) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_logoutButton];
}

- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
    __weak typeof(self) ws = self;
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"午餐提醒" icon:nil action:^(id<MenuAbleItem> menu) {
        LunchAlertViewController *lv = [NSObject loadClass:[LunchAlertViewController class]];
        lv.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:lv];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"互动" icon:nil action:^(id<MenuAbleItem> menu) {
        [ws onSetting];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"招商合作" icon:nil action:^(id<MenuAbleItem> menu) {
        AboutAppCooperationViewController *vc = [NSObject loadClass:[AboutAppCooperationViewController class]];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
    
    
    item = [[MenuItem alloc] initWithTitle:@"检查更新" icon:nil action:^(id<MenuAbleItem> menu) {
        [ws onSetting];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"关于我们" icon:nil action:^(id<MenuAbleItem> menu) {
        AboutUsViewController *vc = [NSObject loadClass:[AboutUsViewController class]];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
}

- (void)onSetting
{
    
}

- (void)onLogout
{
    
}



- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - kBottomButtonHeight);
    [_logoutButton setFrameAndLayout:CGRectMake(0, bounds.size.height - kBottomButtonHeight, bounds.size.width, kBottomButtonHeight)];
    
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
