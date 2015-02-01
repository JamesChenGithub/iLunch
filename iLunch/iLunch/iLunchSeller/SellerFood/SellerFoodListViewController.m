//
//  SellerFoodListViewController.m
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerFoodListViewController.h"

@interface SellerFoodListViewController ()

@end

@implementation SellerFoodListViewController

- (void)addOwnViews
{
    _searchView = [[SellerFoodSearchView alloc] init];
    _searchView.delegate = self;
    [self.view addSubview:_searchView];
    
    [super addOwnViews];
    
    _tableView.rowHeight = 88;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = kClearColor;
//    _tableView.tableHeaderView = _searchView;
}

- (void)configOwnViews
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if ([self tableView:_tableView numberOfRowsInSection:0] == 0)
//        {
            SellerEmptyViewController *view = [[SellerEmptyViewController alloc] init];
            [self addChild:view inRect:_tableView.frame];
            [view setTip:@"暂无餐品"];
//        }
    });
    
}

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    [_searchView sizeWith:CGSizeMake(rect.size.width, kDefaultCellHeight)];
    [_searchView relayoutFrameOfSubViews];
    
    rect.origin.y += kDefaultCellHeight;
    rect.size.height -= kDefaultCellHeight;
    _tableView.frame = rect;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

#define kSellerFoodListCell @"kSellerFoodListCell"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SellerFoodListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSellerFoodListCell];
    if (!cell)
    {
        cell = [[SellerFoodListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSellerFoodListCell];
    }
    return cell;
}


- (void)onSearchView:(SellerFoodSearchView *)bar searchText:(NSString *)search
{
    
}


@end
#endif