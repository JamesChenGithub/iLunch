//
//  SelllerAddFoodViewController.m
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SelllerAddFoodViewController.h"

@interface SelllerAddFoodViewController ()

@property (nonatomic, strong) NSMutableArray *foodItems;

@end

@implementation SelllerAddFoodViewController

- (void)onSelectMenu:(id<MenuAbleItem>)menu
{
    
}

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

- (void)addOwnViews
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = kClearColor;
    [self.view addSubview:_scrollView];
    
    _addFood = [[FoodInfoView alloc] init];
    _addFood.backgroundColor = kWhiteColor;
    [_scrollView addSubview:_addFood];
    
    _editView = [[UIView alloc] init];
    _editView.backgroundColor = kWhiteColor;
    [_scrollView addSubview:_editView];
    
    _foodName = [[TextFieldLine alloc] initLeftWith:@"名称："];
    [_editView addSubview:_foodName];
    
    _foodPrice = [[TextFieldLine alloc] initLeftWith:@"价格："];
    [_editView addSubview:_foodPrice];
    
    _method = [[SellerMethodView alloc] init];
    [_editView addSubview:_method];
    
    
    __weak typeof(self) ws = self;
    _type = [[SellerFoodTypeView alloc] initWithMenus:nil moreAction:^(id selfPtr) {
        [ws expandFoodPanel];
    }];
    [_editView addSubview:_type];
    
    
    _commit = [[UIButton alloc] init];
    [_commit setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_commit setTitle:@"提交" forState:UIControlStateNormal];
    [_commit setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self.view addSubview:_commit];
    
    _line = [[UIView alloc] init];
    _line.backgroundColor = kWhiteColor;
    [self.view addSubview:_line];
    
    
    _continueAdd = [[UIButton alloc] init];
    [_continueAdd setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_continueAdd setTitle:@"提交并继续添加" forState:UIControlStateNormal];
    [_continueAdd setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self.view addSubview:_continueAdd];

}

- (void)expandFoodPanel
{
    if (_foodPanel.superview)
    {
        [_foodPanel removeFromSuperview];
        
        CGFloat height = _editView.frame.origin.y + _editView.frame.size.height;
        
        if (height < _scrollView.bounds.size.height)
        {
            _scrollView.contentSize = CGSizeMake(0, 0);
        }
        else
        {
            _scrollView.contentSize = CGSizeMake(0, height);
        }
        
        if (_scrollView.contentSize.height > _scrollView.bounds.size.height)
        {
            _scrollView.contentOffset = CGPointMake(0, _scrollView.contentSize.height - _scrollView.bounds.size.height);
        }
        else
        {
            _scrollView.contentOffset = CGPointMake(0, 0);
        }
        
        return;
    }
    
    if (!_foodPanel)
    {
        _foodPanel = [[FoodPanel alloc] initWithMenus:self.foodItems];
    }

    [_scrollView addSubview:_foodPanel];
    
    
    CGRect rect = CGRectMake(0, _editView.frame.origin.y + _editView.frame.size.height + 1, _scrollView.bounds.size.width, 64*2);
    [_foodPanel setFrameAndLayout:rect];
    
    CGFloat height = _foodPanel.frame.origin.y + _foodPanel.frame.size.height;
    
    if (height > _scrollView.bounds.size.height)
    {
        _scrollView.contentSize = CGSizeMake(0, height + 20);
        _scrollView.contentOffset = CGPointMake(0, _scrollView.contentSize.height - _scrollView.bounds.size.height);
    }
    
}



- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    
    [_commit sizeWith:CGSizeMake(rect.size.width/2, kBottomButtonHeight)];
    [_commit alignParentBottom];
    
    [_continueAdd sameWith:_commit];
    [_continueAdd layoutToRightOf:_commit];
    
    
    [_line sizeWith:CGSizeMake(2, kBottomButtonHeight - 2*kDefaultMargin)];
    [_line layoutParentHorizontalCenter];
    [_line alignParentBottomWithMargin:kDefaultMargin];
    
    
    rect.size.height -= kBottomButtonHeight;
    _scrollView.frame = rect;
    
    rect = _scrollView.bounds;
    
    [_addFood sizeWith:CGSizeMake(rect.size.width, 130)];
    [_addFood relayoutFrameOfSubViews];
    
    [_editView sizeWith:CGSizeMake(rect.size.width, 240)];
    [_editView layoutBelow:_addFood margin:kDefaultMargin];
    
    rect = _editView.bounds;
    [_foodName sizeWith:CGSizeMake(rect.size.width - 2 * kDefaultMargin, 50)];
    [_foodName layoutParentHorizontalCenter];
    
    [_foodPrice sameWith:_foodName];
    [_foodPrice layoutBelow:_foodName];
    
    [_method sizeWith:CGSizeMake(rect.size.width, 90)];
    [_method layoutBelow:_foodPrice];
    [_method relayoutFrameOfSubViews];
    
    [_type sizeWith:CGSizeMake(rect.size.width - kDefaultMargin, 50)];
    [_type alignParentLeftWithMargin:kDefaultMargin];
    [_type relayoutFrameOfSubViews];
    [_type layoutBelow:_method];
    
    
    CGFloat height = _editView.frame.origin.y + _editView.frame.size.height;
   
    if (height > _scrollView.bounds.size.height)
    {
        _scrollView.contentSize = CGSizeMake(0, height);
    }
    
    
    

    
}

@end
#endif