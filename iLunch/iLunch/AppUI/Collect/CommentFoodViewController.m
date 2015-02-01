//
//  CommentFoodViewController.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "CommentFoodViewController.h"

@implementation CommentFoodViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"点评美食";
}

- (void)addOwnViews
{
    
    MenuItem *item = [[MenuItem alloc] initWithTitle:@"越来牛肉汤粉" icon:[UIImage imageWithColor:kRandomFlatColor size:CGSizeMake(35, 35)] action:nil];
    _foodHead = [[HeaderTitleView alloc] initWith:item];
    [self.view addSubview:_foodHead];
    
    _comment = [[UIPlaceHolderTextView alloc] init];
    _comment.placeHolder = @"留下你对这份服务的评价...";
    [self.view addSubview:_comment];
    
    _publish = [[UIButton alloc] init];
    [_publish addTarget:self action:@selector(onPublich:) forControlEvents:UIControlEventTouchUpInside];
    [_publish setTitle:@"发布" forState:UIControlStateNormal];
    [_publish setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_publish setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [self.view addSubview:_publish];
}

- (void)onPublich:(UIButton *)btn
{
    
}

- (void)layoutOnIPhone
{
    CGRect bounds = self.view.bounds;
    [_foodHead sizeWith:CGSizeMake(bounds.size.width, 55)];
    [_foodHead relayoutFrameOfSubViews];
    
    [_comment sizeWith:CGSizeMake(bounds.size.width, 180)];
    [_comment layoutBelow:_foodHead];
    
    [_publish sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
    [_publish alignParentBottom];
    
}

@end
