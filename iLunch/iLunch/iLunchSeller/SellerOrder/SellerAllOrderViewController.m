//
//  SellerAllOrderViewController.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerAllOrderViewController.h"

@interface SellerAllOrderViewController ()

@end

@implementation SellerAllOrderViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _searchBar = [[DateSearchBar alloc] init];
    _searchBar.delegate = self;
    [_searchBar setFrameAndLayout:CGRectMake(0, 0, self.view.bounds.size.width, kDefaultCellHeight)];
    [self.view addSubview:_searchBar];

}

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    
    [_searchBar sizeWith:CGSizeMake(rect.size.width, kDefaultCellHeight)];
    [_searchBar relayoutFrameOfSubViews];
    
    [_footLabel sizeWith:CGSizeMake(rect.size.width, 30)];
    [_footLabel alignParentBottom];
    
    [_tableView sameWith:_searchBar];
    [_tableView layoutBelow:_searchBar];
    [_tableView scaleToAboveOf:_footLabel];
}

- (void)onDateSearchBar:(DateSearchBar *)bar clickDate:(UIButton *)date
{
    if (!_calendarFloatView)
    {
        _calendarFloatView = [[CalenDarFloatView alloc] init];
        [self.view addSubview:_calendarFloatView];
        [_calendarFloatView sameWith:_searchBar];
        [_calendarFloatView layoutBelow:_searchBar];
        [_calendarFloatView scaleToParentBottom];
        [_calendarFloatView relayoutFrameOfSubViews];
        
        [_calendarFloatView show];
        return;
    }
    
    if (_calendarFloatView.hidden)
    {
        [_calendarFloatView show];
    }
    else
    {
        [_calendarFloatView dismiss];
    }

    
}

 -(void)onDateSearchBar:(DateSearchBar *)bar searchText:(NSString *)search
{
    
}

@end
#endif