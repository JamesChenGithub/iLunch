//
//  MyCommentViewController.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MyCommentViewController.h"

@implementation MyCommentViewController
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
    [self.view addSubview:_tableView];
}

- (void)configOwnViews
{
    _commentItems = [NSMutableArray array];
    
    [_commentItems addObject:[[MenuItem alloc] init]];
//    [_commentItems addObject:[[MenuItem alloc] init]];
//    [_commentItems addObject:[[MenuItem alloc] init]];
    
}

- (void)layoutOnIPhone
{
    _tableView.frame = self.view.bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentItems.count;
}

- (NSString *)testTextOfIndex:(NSIndexPath *)index
{
    NSMutableString *test = [NSMutableString stringWithString:@"这是一个测试这是一个测试这是一个测试这是一个测试"];
    
    for (NSInteger i = 0; i <= index.row; i++)
    {
        [test appendString:@"这是一个测试这是一个测试这是一个测试这是一个测试"];
    }
    return test;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [FoodCommentTableViewCell heightOf:[self testTextOfIndex:indexPath]];
}

#define kMyCollectTableViewCell @"kMyCollectTableViewCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMyCollectTableViewCell];
    if (!cell)
    {
        cell = [[FoodCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCollectTableViewCell];
    }
    [cell configWith:[self testTextOfIndex:indexPath]];
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
        [_commentItems removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentDetailViewController *vc = [NSObject loadClass:[CommentDetailViewController class]];
    vc.title = self.title;
    [[AppDelegate sharedAppDelegate] pushViewController:vc];
}

@end
