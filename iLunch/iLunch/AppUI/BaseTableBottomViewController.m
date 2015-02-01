//
//  BaseTableBottomViewController.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseTableBottomViewController.h"

@implementation BaseTableBottomViewController

- (void)addTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)addBottomButton
{
    _bottomButton = [[UIButton alloc] init];
    [_bottomButton setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_bottomButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_bottomButton addTarget:self action:@selector(onClickBottom) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_bottomButton];
}

- (void)addOwnViews
{
    [self addTableView];
    [self addBottomButton];
    
}

- (void)onClickBottom
{
    
}


- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    _tableView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - kBottomButtonHeight);
    [_bottomButton setFrameAndLayout:CGRectMake(0, bounds.size.height - kBottomButtonHeight, bounds.size.width, kBottomButtonHeight)];
    
}


@end
