//
//  DiscoveryViewController.m
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "DiscoveryViewController.h"

@implementation DiscoveryViewController

- (void)addBackItem
{
    
}

- (void)addOwnViews
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = kDefaultCellHeight;
    [self.view addSubview:_tableView];
}

- (void)layoutOnIPhone
{
    _tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


#define kDiscoveryTableViewCell @"kDiscoveryTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDiscoveryTableViewCell];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDiscoveryTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = kMainTextColor;
    }
    
    cell.textLabel.text = @"美食专家";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverListViewController *lv = [[DiscoverListViewController alloc] init];
    lv.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [[AppDelegate sharedAppDelegate] pushViewController:lv];
}
@end

