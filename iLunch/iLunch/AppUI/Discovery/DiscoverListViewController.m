//
//  DiscoverListViewController.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "DiscoverListViewController.h"

@implementation DiscoverListViewController

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _shareDiscovery = [[UIButton alloc] init];
    [_shareDiscovery setTitle:@"分享我的发现" forState:UIControlStateNormal];
    [_shareDiscovery setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_shareDiscovery setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_shareDiscovery addTarget:self action:@selector(shareDiscovery:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shareDiscovery];
}

- (void)shareDiscovery:(UIButton *)btn
{
    ShareMyDiscoveryViewController *lv = [[ShareMyDiscoveryViewController alloc] init];
    lv.title = [btn titleForState:UIControlStateNormal];
    [[AppDelegate sharedAppDelegate] pushViewController:lv];
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_shareDiscovery sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
    [_shareDiscovery alignParentBottom];
    
    [_tableView sizeWith:bounds.size];
    [_tableView scaleToAboveOf:_shareDiscovery];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSString *)testTextOfIndex:(NSIndexPath *)index
{
    NSMutableString *test = [NSMutableString stringWithString:@"这是一个测试"];
    
    for (NSInteger i = 0; i <= index.row; i++)
    {
        [test appendString:@"这是一个测试"];
    }
    return test;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DiscoveryListTableViewCell heightOf:[self testTextOfIndex:indexPath]];
}

#define kDiscoverListCell @"kDiscoverListCell"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoveryListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDiscoverListCell];
    if (!cell)
    {
        cell = [[DiscoveryListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDiscoverListCell];

    }
    
    [cell configWith:[self testTextOfIndex:indexPath]];
    
    return cell;
}

@end
