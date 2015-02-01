//
//  AboutAppViewController.m
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AboutAppViewController.h"

@implementation AboutAppViewController

- (void)addOwnViews
{
    _logo = [[UIImageView alloc] init];
    _logo.image = kLunchSet_Logo_Icon;
    [self.view addSubview:_logo];
    
    _detail = [[UITextView alloc] init];
    _detail.textColor = kMainTextColor;
    _detail.backgroundColor = kClearColor;
    _detail.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_detail];
}

- (void)layoutOnIPhone
{
    [_logo sizeWith:_logo.image.size];
    [_logo layoutParentHorizontalCenter];
    [_logo alignParentTopWithMargin:30];
    
    [_detail sizeWith:self.view.bounds.size];
    [_detail layoutBelow:_logo margin:30];
    [_detail scaleToParentBottom];
}

@end

@implementation AboutUsViewController

- (void)configOwnViews
{
    _detail.text = @"        爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。";
}

@end

@implementation AboutAppCooperationViewController

- (void)configOwnViews
{
    _detail.text = @"        爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。\n\n\n客服：service@ilunch.cn\n\n媒体报道：media@ilunch.com.cn\n\n商务合作：business@ilunch.com.cn";
}

@end

@implementation AboutServiceViewController

- (void)configOwnViews
{
    _detail.text = @"        1.爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。\n\n2.爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。\n\n3.爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。\n\n爱午餐是一个专注于白领的网络点餐平台，立志成为最好的网络点餐平台。“午餐吃不难，不难吃”是我们处使命。\n\n";
}

@end


















