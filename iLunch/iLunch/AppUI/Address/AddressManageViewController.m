//
//  AddressManageViewController.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddressManageViewController.h"

@interface AddressManageViewController ()

@property (nonatomic, strong) NSMutableArray *menus;

@end

@implementation AddressManageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"地址管理";
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _addNewAddress = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    [_addNewAddress setBackgroundImage:kAddressManage_AddNewAddress_BG_Icon forState:UIControlStateNormal];
    UIImage *tip = kAddressManage_AddNewAddress_Tip_Icon;
    [_addNewAddress setImage:tip forState:UIControlStateNormal];
    _addNewAddress.imageSize = tip.size;
    [_addNewAddress setTitle:@"添加新地址" forState:UIControlStateNormal];
    [_addNewAddress setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_addNewAddress addTarget:self action:@selector(onAddNewAddress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addNewAddress];
}

- (void)configOwnViews
{
    self.menus = [NSMutableArray array];
    
#if kSupportAddressFake
    [self.menus addObject:[[AddressFakeItem alloc] init]];
    [self.menus addObject:[[AddressFakeItem alloc] init]];
    [self.menus addObject:[[AddressFakeItem alloc] init]];
#endif
}

- (void)onAddNewAddress
{
    AddNewAddressViewController *anavc = [NSObject loadClass:[AddNewAddressViewController class]];
    [[AppDelegate sharedAppDelegate] pushViewController:anavc];
}



- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - kBottomButtonHeight);
    [_addNewAddress setFrameAndLayout:CGRectMake(0, bounds.size.height - kBottomButtonHeight, bounds.size.width, 60)];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.menus.count == 0)
    {
        return 1;
    }
    return 2;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kDefaultCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
    {
        return self.menus.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    else
    {
        return @"历史地址";
    }
}

#define kAddressManageLocCurrentTableViewCell @"kAddressManageLocCurrentTableViewCell"
#define kAddressManageTableViewCell @"kAddressManageTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAddressManageLocCurrentTableViewCell];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kAddressManageLocCurrentTableViewCell];
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.imageView.image = kAddressManage_LocateCurrent_Icon;
        cell.textLabel.text = @"定位当前地址";
        return cell;
    }
    else
    {
        
        AddressManageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAddressManageTableViewCell];
        if (!cell)
        {
            cell = [[AddressManageTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kAddressManageTableViewCell];
            cell.textLabel.textColor = kMainTextColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        id<AddressAbleItem> item = self.menus[indexPath.row];
        cell.title.text = [item buildingName];
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !(indexPath.section == 0);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.menus removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

@end
