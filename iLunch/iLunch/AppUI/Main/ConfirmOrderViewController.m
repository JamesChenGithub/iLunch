//
//  ConfirmOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-17.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ConfirmOrderViewController.h"

@implementation ConfirmOrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"确认订单";
    
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _payButton = [[UIButton alloc] init];
    [_payButton setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_payButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_payButton setTitle:@"确认支付" forState:UIControlStateNormal];
    [_payButton addTarget:self action:@selector(onPay:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_payButton];
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_payButton sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
    [_payButton alignParentBottom];
    
    [_tableView sizeWith:bounds.size];
    [_tableView scaleToAboveOf:_payButton];
}

- (void)onPay:(UIButton *)but
{
    
}

- (NSInteger)sectionCount
{
    return 3+1;
}

- (NSInteger)rowCountInSection:(NSInteger)section
{
    return 1 + 4 + 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self sectionCount];
}

typedef enum
{
    EConfirmOrderInfo_Address,
    EConfirmOrderInfo_LunchTime,
    EConfirmOrderInfo_Remark,
    EConfirmOrderInfo_Payment,
    EConfirmOrderInfo_PaymentWay,
    
    EConfirmOrderInfoTypeCount,
    
}ConfirmOrderInfoType;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == [self sectionCount] - 1)
    {
        return EConfirmOrderInfoTypeCount;
    }
    else
    {
        return [self rowCountInSection:section];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    return @"    ";
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == [self sectionCount] - 1)
    {
        return kDefaultCellHeight;
    }
    else
    {
        if (indexPath.row == [self rowCountInSection:indexPath.section] - 1)
        {
            return 30;
        }
        else
        {
            return kDefaultCellHeight;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section == [self sectionCount] - 1)
    {
        switch (indexPath.row)
        {
            case EConfirmOrderInfo_Address:
            {
                TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"新增地址"];
                if (!cell)
                {
                    cell = [[TextFieldTableViewCell alloc] initWith:@"新增地址：" placeHolder:nil locateIcon:kAddressManage_Locate_Icon action:^(id selfPtr) {
                        MyLocationViewController *mvc = [NSObject loadClass:[MyLocationViewController class]];
                        [[AppDelegate sharedAppDelegate] pushViewController:mvc];
                    } reuseIdentifier:@"新增地址"];
                    
                    cell.textLabel.textColor = kMainTextColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                return cell;
            }
                break;
            case EConfirmOrderInfo_LunchTime:
            {
                TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"用餐时间"];
                if (!cell)
                {
                    cell = [[TextFieldTableViewCell alloc] initWith:@"用餐时间：" placeHolder:nil locateIcon:kAddressManage_Locate_Icon action:^(id selfPtr) {
                        MyLocationViewController *mvc = [NSObject loadClass:[MyLocationViewController class]];
                        [[AppDelegate sharedAppDelegate] pushViewController:mvc];
                    } reuseIdentifier:@"用餐时间"];
                    
                    cell.textLabel.textColor = kMainTextColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                return cell;
            }
                break;
            case EConfirmOrderInfo_Remark:
            {
                TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"餐品备注"];
                if (!cell)
                {
                    cell = [[TextFieldTableViewCell alloc] initWith:@"餐品备注：" placeHolder:nil locateIcon:kAddressManage_Locate_Icon action:^(id selfPtr) {
                        MyLocationViewController *mvc = [NSObject loadClass:[MyLocationViewController class]];
                        [[AppDelegate sharedAppDelegate] pushViewController:mvc];
                    } reuseIdentifier:@"餐品备注"];
                    
                    cell.textLabel.textColor = kMainTextColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                return cell;
            }
                break;
            case EConfirmOrderInfo_Payment:
            {
                OrderPaymentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"支付方式"];
                if (!cell)
                {
                    cell = [[OrderPaymentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"支付方式"];
                }
                return cell;
            }
                break;
            case EConfirmOrderInfo_PaymentWay:
            {
                OrderPaymentWayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"支付"];
                if (!cell)
                {
                    cell = [[OrderPaymentWayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"支付"];
                }
                return cell;
            }
                break;
                
                
            default:
                return nil;
                break;
        }
        
        
    }
    else
    {
        
        
        if (indexPath.row == 0)
        {
            // 店名
            OrderShopInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"店名"];
            if (!cell)
            {
                cell = [[OrderShopInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"店名"];
            }
            return cell;
        }
        else if (indexPath.row == [self rowCountInSection:indexPath.section] - 1)
        {
            
            // 返回总额
            OrderAllItemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"返回总额"];
            if (!cell)
            {
                cell = [[OrderAllItemInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"返回总额"];
            }
            return cell;
        }
        else
        {
            // 订单数据
            FoodOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"订单数据"];
            if (!cell)
            {
                cell = [[FoodOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"订单数据"];
            }
            return cell;
        }
    }
}

@end
