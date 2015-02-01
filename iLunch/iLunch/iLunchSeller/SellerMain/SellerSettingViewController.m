//
//  SellerSettingViewController.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerSettingViewController.h"

@implementation SellerSettingViewController

- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
    __weak typeof(self) ws = self;
    
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"招商合作" icon:nil action:^(id<MenuAbleItem> menu) {
        AboutAppCooperationViewController *vc = [NSObject loadClass:[AboutAppCooperationViewController class]];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
    
    
    item = [[MenuItem alloc] initWithTitle:@"检查更新" icon:nil action:^(id<MenuAbleItem> menu) {

    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"关于我们" icon:nil action:^(id<MenuAbleItem> menu) {
        AboutUsViewController *vc = [NSObject loadClass:[AboutUsViewController class]];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? nil : @"    ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kDefaultCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
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
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"会员中心";
    }
    else
    {
        MenuItem *item = self.menus[indexPath.row];
        cell.textLabel.text = item.title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        // TODO:会员中心
        SellerCenterViewController *vc = [NSObject loadClass:[SellerCenterViewController class]];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }
    else
    {
        MenuItem *item = self.menus[indexPath.row];
        [item menuAction];
    }
}

@end
#endif