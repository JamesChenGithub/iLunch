//
//  AddNewAddressViewController.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddNewAddressViewController.h"






@implementation AddNewAddressViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新增地址";
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _saveAddress = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    [_saveAddress setBackgroundImage:kAddressManage_AddNewAddress_BG_Icon forState:UIControlStateNormal];
    
    [_saveAddress setTitle:@"保存地址" forState:UIControlStateNormal];
    [_saveAddress setTitleColor:kWhiteColor forState:UIControlStateNormal];
    
    [_saveAddress addTarget:self action:@selector(onSaveNewAddress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_saveAddress];
}

- (void)configOwnViews
{
    
}

- (void)onSaveNewAddress
{
    
}



- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - kBottomButtonHeight);
    [_saveAddress setFrameAndLayout:CGRectMake(0, bounds.size.height - kBottomButtonHeight, bounds.size.width, 60)];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return EAddNewAddressViewCell_Count;
}



#define kNewAddressTableViewCell @"kNewAddressTableViewCell"
#define kNewAddressGenderTableViewCell @"kNewAddressGenderTableViewCell"
#define kNewAddressLocationTableViewCell @"kNewAddressLocationTableViewCell"

- (UITableViewCell *)configCellOfIndexPath:(NSIndexPath *)path
{
    NSString *identifier = [NSString stringWithFormat:@"%@_%ld", kNewAddressTableViewCell, path.row];
    TextFieldTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        NSString *tip = nil;
        NSString *holder = nil;
        
        switch (path.row) {
            case EAddNewAddressViewCell_Contact:
                tip = @"联系人：";
                holder = @"您的姓名";
                break;
            case EAddNewAddressViewCell_PhoneNum:
                tip = @"手机：";
                holder = @"送餐员能联系到您";
                break;
            case EAddNewAddressViewCell_DetailAddress:
                tip = @"详细地址：";
                holder = @"输入您所在的详细地址";
                
                break;
                
            default:
                break;
        }
        
        cell = [[TextFieldTableViewCell alloc] initWith:tip placeHolder:holder reuseIdentifier:identifier];
        
        cell.textLabel.textColor = kMainTextColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == EAddNewAddressViewCell_Gender)
    {
        AddNewAddressGenderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewAddressGenderTableViewCell];
        if (!cell)
        {
            cell = [[AddNewAddressGenderTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kNewAddressGenderTableViewCell];
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    else if (indexPath.row == EAddNewAddressViewCell_Location)
    {
        TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewAddressLocationTableViewCell];
        if (!cell)
        {
            
            cell = [[TextFieldTableViewCell alloc] initWith:@"我的位置：" placeHolder:@"所在区域" locateIcon:kAddressManage_Locate_Icon action:^(id selfPtr) {
                MyLocationViewController *mvc = [NSObject loadClass:[MyLocationViewController class]];
                [[AppDelegate sharedAppDelegate] pushViewController:mvc];
            } reuseIdentifier:kNewAddressLocationTableViewCell];
            
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    }
    else
    {
        return [self configCellOfIndexPath:indexPath];
    }
}

@end
