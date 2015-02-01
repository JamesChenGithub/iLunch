//
//  SellerCenterViewController.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerCenterViewController.h"

@implementation SellerCenterViewController

- (void)configOwnViews
{
    _data = [NSMutableArray array];

    __weak typeof(self) ws = self;
    
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"个人资料" icon:nil action:^(id<MenuAbleItem> menu) {
        SellerInfoViewController *vc = [[SellerInfoViewController alloc] init];
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }];
    [_data addObject:item];
    
    
    item = [[MenuItem alloc] initWithTitle:@"修改密码" icon:nil action:^(id<MenuAbleItem> menu) {
        
        SellerModifyPwdViewControllre *vc = [[SellerModifyPwdViewControllre alloc] init];
        [ws presentViewController:vc animated:YES completion:^{
            
        }];
    }];
    [_data addObject:item];
    
    
}


- (void)configCell:(UITableViewCell *)cell withMenu:(MenuItem *)kv
{
    cell.textLabel.text = [kv title];
}

#define kWTATableCellIdentifier @"kWTATableCellIdentifier"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWTATableCellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kWTATableCellIdentifier];
        cell.textLabel.textColor = kMainTextColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MenuItem *kv = _data[indexPath.row];
    [self configCell:cell withMenu:kv];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItem *kv = _data[indexPath.row];
    [kv menuAction];
}
@end
#endif