//
//  MyLocationViewController.m
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MyLocationViewController.h"

@interface LocationMenuItem : MenuItem<NextMenuChainAble>

@property (nonatomic, weak) id<ListAbleItem> selectItem;
//@property (nonatomic, weak) id<NextMenuChainAble> previous;
//@property (nonatomic, weak) id<NextMenuChainAble> next;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation LocationMenuItem

- (NSArray *)dataSource
{
    if (_dataSource)
    {
        return _dataSource;
    }
    
    return [self.selectItem list];
}

@end

@interface MyLocationViewController()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) LocationMenuItem *city;
@property (nonatomic, strong) LocationMenuItem *section;
@property (nonatomic, strong) LocationMenuItem *building;

@property (nonatomic, strong) NSArray *menuIndexs;

@property (nonatomic, weak) LocationMenuItem *selectMenu;

@end

@implementation MyLocationViewController

- (BOOL)canSelect:(LocationMenuItem *)item
{
    if (item == self.city)
    {
        return YES;
    }
    else if (item == self.section)
    {
        return self.city.selectItem;
    }
    else //if (item == self.building)
    {
        return self.city.selectItem && self.section.selectItem;
    }

}

- (void)onSelect:(LocationMenuItem *)item
{
    if (![self canSelect:item])
    {
        return;
    }
    
    if (self.selectMenu == item)
    {
        return;
    }
    
    self.selectMenu = item;
    
//    self.selectMenu.value = nil;
    
    
    __weak typeof(self) ws = self;
    if (item == self.city)
    {
        [ws.tableView reloadData];
    }
    else if (item == self.section)
    {
        NSArray *list = [self.city.selectItem list];
        if (list == nil)
        {
            GetSection *req = [[GetSection alloc] initWithHandler:^(BaseRequest *request) {
                ws.section.dataSource = [ws.city.selectItem list];
                [ws.tableView reloadData];
            } failHandler:^(BaseRequest *request) {
                // 选回到City
                ws.selectMenu = ws.city;
                [ws backSelectMenu];
            }];
            req.city = (CityItem *)self.city.selectItem;
            [[WebServiceEngine sharedEngine] asyncRequest:req];
        }
        else
        {
            ws.section.dataSource = list;
            [ws.tableView reloadData];
        }
    }
    else if (item == self.building)
    {
         NSArray *list = [self.section.selectItem list];
        if (list == nil)
        {
            GetBuilding *req = [[GetBuilding alloc] initWithHandler:^(BaseRequest *request) {
                ws.building.dataSource = [ws.section.selectItem list];
                [ws.tableView reloadData];
            } failHandler:^(BaseRequest *request) {
                // 选回到City
                ws.selectMenu = ws.selectMenu;
                [ws backSelectMenu];
            }];
            req.section = (CitySectionItem *)self.section.selectItem;
            [[WebServiceEngine sharedEngine] asyncRequest:req];
        }
        else
        {
            ws.building.dataSource = list;
            [ws.tableView reloadData];
        }
    }
    
//    [_tableView reloadData];
}


- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    __weak typeof(self) ws = self;
    self.city = [[LocationMenuItem alloc] initWithTitle:@"城市" icon:nil action:^(LocationMenuItem *menu) {
        [ws onSelect:menu];
    }];

    
    self.section = [[LocationMenuItem alloc] initWithTitle:@"区" icon:nil action:^(LocationMenuItem *menu) {
        [ws onSelect:menu];
    }];
    
    self.building = [[LocationMenuItem alloc] initWithTitle:@"所在大厦" icon:nil action:^(LocationMenuItem *menu) {
        [ws onSelect:menu];
    }];

    
    
    self.selectMenu = self.city;
    
    self.menuIndexs = @[self.city, self.section, self.building];
    
    _header = [[ScrollIndexView alloc] initWithMenus:self.menuIndexs];
    _header.willClick = ^(LocationMenuItem *item) {
         return [ws canSelect:item];
    };
    
    [self.view addSubview:_header];
    
    
    [self onSelect:self.city];
    
    _saveAddress = [[UIButton alloc] init];
    [_saveAddress setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_saveAddress setTitle:@"保存地址" forState:UIControlStateNormal];
    [_saveAddress setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_saveAddress addTarget:self action:@selector(onSaveAddress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_saveAddress];
    
    [self enableSaveAddress];
}

- (void)configOwnViews
{
    [self requestCity];
}

- (void)requestCity
{
    __weak typeof(self) ws = self;
    GetCity *gcreq = [[GetCity alloc] initWithHandler:^(BaseRequest *request) {
        GetCityResponse *resp = (GetCityResponse *)request.response;
        ws.city.dataSource = resp.cityList;
        [ws.tableView reloadData];
    }];
    [[WebServiceEngine sharedEngine] asyncRequest:gcreq];
}

- (void)requestSection:(CityItem *)item
{
    
}

- (void)layoutOnIPhone
{
    CGRect bound = self.view.bounds;
    [_header sizeWith:CGSizeMake(bound.size.width, 45)];
    [_header relayoutFrameOfSubViews];
    
    [_saveAddress sizeWith:CGSizeMake(bound.size.width, kBottomButtonHeight)];
    [_saveAddress alignParentBottom];
    
    [_tableView sameWith:_header];
    [_tableView layoutBelow:_header];
    [_tableView scaleToAboveOf:_saveAddress];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectMenu.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kDefaultCellHeight;
}


#define kLocationTableViewCell @"kLocationTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLocationTableViewCell];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLocationTableViewCell];
        cell.textLabel.textColor = kMainTextColor;
    }
    
    id<LocationShowAbleItem> item = [self.selectMenu.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [item showName];
    
    NSInteger index = [self.selectMenu.dataSource indexOfObject:self.selectMenu.selectItem];
    cell.accessoryType = index == indexPath.row ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.selectMenu == self.city)
    {
        return nil;
    }
    else if (self.selectMenu == self.section)
    {
        return [NSString stringWithFormat:@"%@", [(id<LocationShowAbleItem>)self.city.selectItem showName]];
    }
    else
    {
        return [NSString stringWithFormat:@"%@-%@", [(id<LocationShowAbleItem>)self.city.selectItem showName], [(id<LocationShowAbleItem>)self.section.selectItem showName]];
    }
}

- (void)backSelectMenu
{
    NSInteger index = [self.menuIndexs indexOfObject:self.selectMenu];
    
    if (index + 1 < self.menuIndexs.count)
    {
        
        // 清掉之后的选项
        for (NSInteger i = index + 1; i < self.menuIndexs.count; i++)
        {
            LocationMenuItem *item = self.menuIndexs[i];
            item.dataSource = nil;
            item.selectItem = nil;
        }
    }
    
     [_header selectIndexOf:index];
    
    
    
}

- (void)prepareSelectMenu
{
    NSInteger index = [self.menuIndexs indexOfObject:self.selectMenu];
    
    if (index + 1 < self.menuIndexs.count)
    {
        
        // 清掉之后的选项
        for (NSInteger i = index + 1; i < self.menuIndexs.count; i++)
        {
            LocationMenuItem *item = self.menuIndexs[i];
            item.dataSource = nil;
            item.selectItem = nil;
        }
        
        [_header selectIndexOf:index+1];
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lastIndex = [self.selectMenu.dataSource indexOfObject:self.selectMenu.selectItem];
    
    if (lastIndex != indexPath.row)
    {
        UITableViewCell *lasecell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:lastIndex inSection:0]];
        lasecell.accessoryType = UITableViewCellAccessoryNone;
        
        
        self.selectMenu.selectItem = [self.selectMenu.dataSource objectAtIndex:indexPath.row];
        lasecell = [tableView cellForRowAtIndexPath:indexPath];
        lasecell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [self prepareSelectMenu];
        
    }
    
    [self enableSaveAddress];
    
}


- (void)enableSaveAddress
{
    _saveAddress.enabled = self.city.selectItem && self.section.selectItem && self.building.selectItem;
}

- (void)onSaveAddress:(UIButton *)button
{
    NSString *address = [NSString stringWithFormat:@"%@%@%@", [(id<LocationShowAbleItem>)self.city.selectItem showName], [(id<LocationShowAbleItem>)self.section.selectItem showName], [(id<LocationShowAbleItem>)self.building.selectItem showName]];
    if (_addressCompletion)
    {
        _addressCompletion(address);
    }
    
    [[AppDelegate sharedAppDelegate] popViewController];
}

@end
