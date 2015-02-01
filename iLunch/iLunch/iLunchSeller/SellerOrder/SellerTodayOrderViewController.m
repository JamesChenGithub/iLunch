//
//  SellerTodayOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerTodayOrderViewController.h"

@interface SellerTodayOrderViewController ()

@end

@implementation SellerTodayOrderViewController

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _footLabel = [[UILabel alloc] init];
    _footLabel.font = [UIFont systemFontOfSize:14];
    _footLabel.textColor = kMainTextColor;
    _footLabel.backgroundColor = kAppBakgroundColor;
    _footLabel.layer.borderWidth = 1;
    _footLabel.layer.borderColor = kGrayTextColor.CGColor;
    [self.view addSubview:_footLabel];

}

- (void)configOwnViews
{

//    _footLabel.text = @"    今日订单数：12";
  
    NSString *count = @"12";
    NSString *info = [NSString stringWithFormat:@"    今日订单数：%@", count];
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:info];
    
    [attriString addAttribute:NSForegroundColorAttributeName value:kPriceTextColor range:NSMakeRange(info.length - count.length, count.length)];
    
    _footLabel.attributedText = attriString;
}

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, rect.size.width, rect.size.height - 30);
    _footLabel.frame = CGRectMake(0, rect.size.height - 30, rect.size.width, 30);

}

- (NSInteger)orderCount
{
    return 10;
}

- (NSInteger)orderItemsOf:(NSInteger)orderCount
{
    return 1+ 3 + 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self orderCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self orderItemsOf:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kDefaultMargin;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"   ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 30;
    }
    else if (indexPath.row == [self orderItemsOf:indexPath.section] - 2)
    {
        return 35;
    }
    else if (indexPath.row == [self orderItemsOf:indexPath.section] - 1)
    {
        return 30;
    }
    else
    {
        return kDefaultCellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        // 订单号
        OrderTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单号"];
        if (!cell)
        {
            cell = [[OrderTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单号"];
        }
        
        return cell;
    }
    else if (indexPath.row == [self orderItemsOf:indexPath.section] - 2)
    {
        // 订单总信息
        OrderAllItemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单总信息"];
        if (!cell)
        {
            cell = [[OrderAllItemInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单总信息"];
        }
        
        return cell;
        
    }
    else if (indexPath.row == [self orderItemsOf:indexPath.section] - 1)
    {
        // 订单联系人
        OrderContatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单联系人"];
        if (!cell)
        {
            cell = [[OrderContatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单联系人"];
        }
        
        return cell;
    }
    else
    {
        // 订单项
        FoodOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单项"];
        if (!cell)
        {
            cell = [[FoodOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单项"];
        }
        
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SellerOrderDetailViewController *detail = [[SellerOrderDetailViewController alloc] init];
    [[AppDelegate sharedAppDelegate] pushViewController:detail];
}



@end
#endif