//
//  SellerInfoViewController.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerInfoViewController.h"

@implementation SellerInfoViewController

- (void)addTableView
{
    [super addTableView];
    
    SellerInfoView *info = [[SellerInfoView alloc] init];
    info.backgroundColor = self.view.backgroundColor;
    [info setFrameAndLayout:CGRectMake(0, 0, self.view.bounds.size.width, 120)];
    _tableView.tableHeaderView = info;
}

- (void)addBottomButton
{
    [super addBottomButton];
    [_bottomButton setTitle:@"保存" forState:UIControlStateNormal];
}

typedef enum {
    ESellerInfoCellType_Name,
    ESellerInfoCellType_Account,
    ESellerInfoCellType_Phone,
    ESellerInfoCellType_Email,
    
    ESellerInfoCellType_Count,
    
}SellerInfoCellType;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ESellerInfoCellType_Count;
}


- (NSString *)reuseIndentifier:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case ESellerInfoCellType_Name:
            return @"ESellerInfoCellType_Name";
            
            break;
        case ESellerInfoCellType_Account:
            return @"ESellerInfoCellType_Account";
            break;
        case ESellerInfoCellType_Phone:
            return @"ESellerInfoCellType_Phone";
            
            break;
        case ESellerInfoCellType_Email:
            return @"ESellerInfoCellType_Email";
            break;
        default:
            return @"SellerInfoCellType";
            break;
    }
}

- (NSString *)leftTipOf:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case ESellerInfoCellType_Name:
            return @"姓名：";
            
            break;
        case ESellerInfoCellType_Account:
            return @"账号：";
            break;
        case ESellerInfoCellType_Phone:
            return @"电话：";
            
            break;
        case ESellerInfoCellType_Email:
            return @"邮箱：";
            break;
        default:
            return @"SellerInfoCellType";
            break;
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indentifier = [self reuseIndentifier:indexPath];
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[TextFieldTableViewCell alloc] initWith:[self leftTipOf:indexPath] reuseIdentifier:indentifier];
    }
    return cell;
}

@end
#endif
