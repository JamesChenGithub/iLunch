//
//  SellerRegistViewController.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerRegistViewController.h"

@implementation SellerRegistViewController


- (void)addBottomButton
{
    [super addBottomButton];
    [_bottomButton setTitle:@"提交" forState:UIControlStateNormal];
}

- (void)addOwnViews
{
    [super addOwnViews];
    
    _service = [[UILabel alloc] init];
    _service.textAlignment = NSTextAlignmentCenter;
    _service.textColor = kLightGrayColor;
    _service.text = @"服务范围";
    [self.view addSubview:_service];
    
    
    
    _addEdit = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    UIImage *img = [UIImage imageNamed:@"place_edit_icon.png"];
    [_addEdit setImageSize:img.size];
    [_addEdit setTitleColor:kLightGrayColor forState:UIControlStateNormal];
    [_addEdit setImage:img forState:UIControlStateNormal];
    [_addEdit setTitle:@"添加" forState:UIControlStateNormal];
    [_addEdit addTarget:self action:@selector(onAddAddress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addEdit];
    
    _serviceTableView = [[UITableView alloc] init];
    _serviceTableView.delegate = self;
    _serviceTableView.dataSource = self;
    _serviceTableView.backgroundColor = kClearColor;
    _serviceTableView.rowHeight = 44;
    [self.view addSubview:_serviceTableView];
}

- (void)onAddAddress:(UIButton *)btn
{
    MyLocationViewController *loc = [[MyLocationViewController alloc] init];
    [[AppDelegate sharedAppDelegate] pushViewController:loc];
}

typedef enum {
    ESellerRegistInfoCellType_ShopName,
    ESellerRegistInfoCellType_Contact,
    ESellerRegistInfoCellType_Phone,
    ESellerRegistInfoCellType_Address,
    
    ESellerRegistInfoCellType_Count,
    
}SellerRegistInfoCellType;

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, bounds.size.width, ESellerRegistInfoCellType_Count * kDefaultCellHeight);
    _tableView.scrollEnabled = NO;
    
    [_bottomButton setFrameAndLayout:CGRectMake(0, bounds.size.height - kBottomButtonHeight, bounds.size.width, kBottomButtonHeight)];
    
    [_service sizeWith:CGSizeMake(bounds.size.width - 160, 44)];
    [_service layoutParentHorizontalCenter];
    [_service layoutBelow:_tableView margin:10];
    
    [_addEdit sizeWith:CGSizeMake(60, 44)];
    [_addEdit alignCenterOf:_service];
    [_addEdit alignParentRightWithMargin:10];
    
    [_serviceTableView sameWith:_tableView];
    [_serviceTableView layoutBelow:_service];
    [_serviceTableView scaleToAboveOf:_bottomButton];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _tableView)
    {
        return ESellerRegistInfoCellType_Count;
    }
    else
    {
        return 10;
    }
}


- (NSString *)reuseIndentifier:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case ESellerRegistInfoCellType_ShopName:
            return @"ESellerRegistInfoCellType_ShopName";
            
            break;
        case ESellerRegistInfoCellType_Contact:
            return @"ESellerRegistInfoCellType_Contact";
            break;
        case ESellerRegistInfoCellType_Phone:
            return @"ESellerRegistInfoCellType_Phone";
            
            break;
        case ESellerRegistInfoCellType_Address:
            return @"ESellerRegistInfoCellType_Address";
            break;
        default:
            return @"SellerRegistInfoCellType";
            break;
    }
}

- (NSString *)leftTipOf:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case ESellerRegistInfoCellType_ShopName:
            return @"店名：";
            
            break;
        case ESellerRegistInfoCellType_Contact:
            return @"联系人：";
            break;
        case ESellerRegistInfoCellType_Phone:
            return @"手机：";
            
            break;
        case ESellerRegistInfoCellType_Address:
            return @"地址：";
            break;
        default:
            return @"SellerRegistInfoCellType";
            break;
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView)
    {
        NSString *indentifier = [self reuseIndentifier:indexPath];
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if (!cell)
        {
            cell = [[TextFieldTableViewCell alloc] initWith:[self leftTipOf:indexPath] reuseIdentifier:indentifier];
        }
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceRecodeCell"];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceRecodeCell"];
            cell.backgroundColor = kClearColor;
            cell.textLabel.textColor = kMainTextColor;
        }
        
        cell.textLabel.text = @"地王大厦";
        return cell;
    }
    
}

@end
#endif
