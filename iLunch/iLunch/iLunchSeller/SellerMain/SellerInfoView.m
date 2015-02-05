//
//  SellerInfoView.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerInfoView.h"

@implementation SellerInfoView

- (void)setClickAdd:(MenuAction)action
{
    [_addButton setClickAction:action];
}

- (void)addOwnViews
{
    _addButton = [[MenuButton alloc] init];
    [self addSubview:_addButton];
    
    _addTip = [[UILabel alloc] init];
    _addTip.textAlignment = NSTextAlignmentCenter;
    _addTip.textColor = kMainTextColor;
    _addTip.font = [UIFont systemFontOfSize:14];
    [self addSubview:_addTip];
}

- (void)configOwnViews
{
    [_addButton setImage:[UIImage imageNamed:@"head_add"] forState:UIControlStateNormal];
    _addTip.text = @"添加商标图片";
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.bounds;
    
    UIImage *img = [_addButton imageForState:UIControlStateNormal];
    [_addButton sizeWith:img.size];
    [_addButton layoutParentCenter];
    
    [_addTip sizeWith:CGSizeMake(rect.size.width, (rect.size.height - img.size.height)/2)];
    [_addTip layoutBelow:_addButton];
}

@end

@implementation FoodInfoView

- (void)configOwnViews
{
    [_addButton setImage:[UIImage imageNamed:@"but_picadd"] forState:UIControlStateNormal];
    _addTip.text = @"添加餐品图片";
}


@end

#endif
