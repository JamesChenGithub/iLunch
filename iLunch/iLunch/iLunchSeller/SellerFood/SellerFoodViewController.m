//
//  SellerFoodViewController.m
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerFoodViewController.h"

@interface SellerFoodViewController ()


@end

@implementation SellerFoodViewController

- (void)configOwnViews
{
    self.data = [NSMutableArray array];
    
//    __weak typeof(self) ws = self;
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"餐品列表" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerFoodListViewController *vc = [NSObject loadClass:[SellerFoodListViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_data addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"添加餐品" icon:nil action:^(id<MenuAbleItem> menu) {
        SelllerAddFoodViewController *vc = [NSObject loadClass:[SelllerAddFoodViewController class]];
        vc.title = [menu title];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_data addObject:item];
}

#define kWTATableCellIdentifier @"kWTATableCellIdentifier"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWTATableCellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kWTATableCellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = kMainTextColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MenuItem *kv = _data[indexPath.row];
    cell.textLabel.text= [kv title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItem *kv = _data[indexPath.row];
    [kv menuAction];
}


@end
#endif