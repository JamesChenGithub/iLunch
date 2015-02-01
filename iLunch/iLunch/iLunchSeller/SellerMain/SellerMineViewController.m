//
//  SellerMineViewController.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerMineViewController.h"

@implementation SellerMineViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _logout = [[UIButton alloc] init];
    [_logout setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_logout setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logout setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self.view addSubview:_logout];
}

- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
    __weak typeof(self) ws = self;
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"订单管理" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerOrderViewController *vc = [NSObject loadClass:[SellerOrderViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"店铺管理" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerRegistViewController *vc = [NSObject loadClass:[SellerRegistViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"餐品管理" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerFoodViewController *vc = [NSObject loadClass:[SellerFoodViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
    
    
    item = [[MenuItem alloc] initWithTitle:@"点评管理" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerCommentViewController *vc = [NSObject loadClass:[SellerCommentViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_menus addObject:item];
}

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    
    rect.size.height = kMainScreenHeight - kBottomButtonHeight;
    _tableView.frame = CGRectFromCGSize(rect.size);
    
    _logout.frame = CGRectMake(0, _tableView.frame.origin.y + _tableView.frame.size.height, rect.size.width, kBottomButtonHeight);
}

#define kMineTableViewCell @"kMineTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SellMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMineTableViewCell];
    if (!cell)
    {
        cell = [[SellMineTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kMineTableViewCell];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = kMainTextColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MenuItem *item = self.menus[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}



@end
#endif