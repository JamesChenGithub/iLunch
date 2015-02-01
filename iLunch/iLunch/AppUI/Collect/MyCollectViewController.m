//
//  MyCollectViewController.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MyCollectViewController.h"

@implementation MyCollectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    _tableView.rowHeight = 56;
    
    [self.view addSubview:_tableView];
}

- (void)configOwnViews
{
    _collectItems = [NSMutableArray array];

    [_collectItems addObject:[[MenuItem alloc] init]];
    [_collectItems addObject:[[MenuItem alloc] init]];
    [_collectItems addObject:[[MenuItem alloc] init]];

}

- (void)layoutOnIPhone
{
    _tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _collectItems.count;
}

#define kMyCollectTableViewCell @"kMyCollectTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodCollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMyCollectTableViewCell];
    if (!cell)
    {
        cell = [[FoodCollectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCollectTableViewCell];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_collectItems removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentFoodViewController *vc = [NSObject loadClass:[CommentFoodViewController class]];
    [[AppDelegate sharedAppDelegate] pushViewController:vc];
}

@end
