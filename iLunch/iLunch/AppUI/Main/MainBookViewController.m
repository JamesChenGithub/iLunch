//
//  MainBookViewController.m
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MainBookViewController.h"

@interface MainBookViewController ()

@property (nonatomic, strong) NSMutableArray *foodItems;

@end

@implementation MainBookViewController

- (NSMutableArray *)foodItems
{
    if (_foodItems)
    {
        return _foodItems;
    }
    
    _foodItems = [NSMutableArray array];
    
    __weak typeof(self) ws = self;
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"全部" icon:[UIImage imageNamed:@"menu_icon_all.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"套餐" icon:[UIImage imageNamed:@"menu_icon_plans.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"饭" icon:[UIImage imageNamed:@"menu_icon_rice.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"粉面" icon:[UIImage imageNamed:@"menu_icon_noodles.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"熟食" icon:[UIImage imageNamed:@"menu_icon_sushi.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"西餐" icon:[UIImage imageNamed:@"menu_icon_food.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    item = [[MenuItem alloc] initWithTitle:@"清真" icon:[UIImage imageNamed:@"menu_icon_halal.png"] action:^(id<MenuAbleItem> menu) {
        [ws onSelectMenu:menu];
    }];
    [_foodItems addObject:item];
    
    return _foodItems;
}

- (void)onSelectMenu:(id<MenuAbleItem>)menu
{
    
}

- (void)withdrawFoodPanel
{
    if (_foodPanel.superview)
    {
        [_foodPanel dismiss];
    }
}

- (void)expandFoodPanel
{
    
    [self withdrawShoppingList];
    if (_foodPanel.superview)
    {
        return;
    }
    
    if (!_foodPanel)
    {
        _foodPanel = [[FoodPanel alloc] initWithMenus:self.foodItems];
    }
    
    [self.view addSubview:_foodPanel];

    [_foodPanel setFrameAndLayout:_tableView.frame];
    
    [_foodPanel show];
    
}

- (void)withdrawShoppingList
{
    if (_shoppingList.superview)
    {
        [_shoppingList dismiss];
    }
}
- (void)expandShoppingList
{
    [self withdrawFoodPanel];
    if (_shoppingList.superview)
    {
        return;
    }
    
    if (!_shoppingList)
    {
        _shoppingList = [[ShoppingListView alloc] init];
    }
    
    [self.view addSubview:_shoppingList];
    
    [_shoppingList setFrameAndLayout:_tableView.frame];
    
    [_shoppingList show];
}

- (void)addOwnViews
{
    
    __weak typeof(self) ws = self;
    
    MenuItem *headInfo = [[MenuItem alloc] initWithTitle:@"地王大厦1818号" icon:[UIImage imageNamed:@"icon_place1.png"] action:^(id<MenuAbleItem> menu) {
        MyLocationViewController *lv = [[MyLocationViewController alloc] init];
        [[AppDelegate sharedAppDelegate] pushViewController:lv];
    }];
    _buildTitle = [[HeaderTitleView alloc] initWith:headInfo];
    [self.view addSubview:_buildTitle];
    
    
    _foodIndex = [[ScrollIndexMoreView alloc] initWithMenus:self.foodItems likeAction:^(id selfPtr) {
        
    } moreAction:^(id selfPtr) {
        
        [ws expandFoodPanel];
    }];
    
    [self.view addSubview:_foodIndex];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _shoppingCart = [[ShoppingCartView alloc] initWith:^(ShoppingCartView *selfPtr) {
        [ws expandShoppingList];
    }];
    [self.view addSubview:_shoppingCart];
}

- (void)configOwnViews
{
    _shoppingCart.orderAction = ^(id<MenuAbleItem> item){
        ConfirmOrderViewController *info = [[ConfirmBookOrderViewController alloc] init];
        [[AppDelegate sharedAppDelegate] pushViewController:info];
    };
}

- (void)layoutOnIPhone
{
    CGRect bound = self.view.bounds;
    [_buildTitle sizeWith:CGSizeMake(bound.size.width, 45)];
    [_buildTitle relayoutFrameOfSubViews];
    
    [_foodIndex sameWith:_buildTitle];
    [_foodIndex layoutBelow:_buildTitle];
    [_foodIndex relayoutFrameOfSubViews];
    
    
    [_shoppingCart sizeWith:CGSizeMake(bound.size.width, 50)];
    [_shoppingCart alignParentBottom];
    [_shoppingCart relayoutFrameOfSubViews];
    
    [_tableView sameWith:_foodIndex];
    [_tableView layoutBelow:_foodIndex];
    [_tableView scaleToAboveOf:_shoppingCart];
    
    

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#define kFoodDetailTableViewCell @"FoodDetailTableViewCell"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFoodDetailTableViewCell];
    if (!cell) {
        cell = [[FoodDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFoodDetailTableViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end