//
//  SellerOrderDetailViewController.m
//  iLunch
//
//  Created by James on 15-1-20.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerOrderDetailViewController.h"

@interface SellerOrderDetailViewController ()

@end

@implementation SellerOrderDetailViewController

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _footView = [[UIView alloc] init];
    
    
    _footLabel = [[UILabel alloc] init];
    _footLabel.textColor = kDetailTextColor;
    _footLabel.font = [UIFont systemFontOfSize:14];
    _footLabel.numberOfLines = 0;
    _footLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_footView addSubview:_footLabel];
    
}

- (void)configOwnViews
{
//    _footLabel.text = @"    今日订单数：12";
    [self configFootView];
}

- (void)configFootView
{
    CGRect rect = self.view.bounds;
    
    _footLabel.text = @"\n订单详情 \n\n订单号：1212312341234234142 \n\n下单时间：2014-12-11 11:14 \n\n支付方式：微信支付\n\n手机号码：123456789009\n\n";
    
    
    CGSize size = [_footLabel textSizeIn:CGSizeMake(rect.size.width - 2 * kDefaultMargin, HUGE_VALF)];
    _footLabel.frame = CGRectMake(kDefaultMargin, kDefaultMargin, rect.size.width - 2 * kDefaultMargin, size.height + 2);
    
    _footView.frame = CGRectMake(0, 0, rect.size.width, size.height + 2 + 2 * kDefaultMargin);
    _tableView.tableFooterView = _footView;
}


- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    _tableView.frame = rect;
}


- (NSInteger)orderItemsOf:(NSInteger)orderCount
{
    return 2 + 3 + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self orderItemsOf:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self orderItemsOf:indexPath.section] - 1)
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
        // 订单状态
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单状态"];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单状态"];
            cell.textLabel.textColor = kMainTextColor;
        }
        cell.imageView.image = [UIImage imageNamed:@"icon_affirm"];
        cell.textLabel.text = @"交易成功";
        return cell;
    }
    else if (indexPath.row == 1)
    {
        // 订单联系人
        OrderContatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单联系人"];
        if (!cell)
        {
            cell = [[OrderContatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单联系人"];
        }
        
        return cell;
       
        
    }
    else if (indexPath.row == [self orderItemsOf:indexPath.section] - 1)
    {
        // 订单总信息
        OrderAllItemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单总信息"];
        if (!cell)
        {
            cell = [[OrderAllItemInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单总信息"];
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

@end
#endif