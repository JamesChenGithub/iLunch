//
//  SellMineTableViewCell.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellMineTableViewCell.h"

@implementation SellMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _tipCount = [[UILabel alloc] init];
        _tipCount.backgroundColor = kRedColor;
        _tipCount.textAlignment = NSTextAlignmentCenter;
        _tipCount.font = [UIFont systemFontOfSize:10];
        _tipCount.textColor = kWhiteColor;
        [self.contentView addSubview:_tipCount];

        [self configOwnViews];
    }
    return self;
}

- (void)configOwnViews
{
    _tipCount.text = @"4";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.contentView.bounds;
    
    CGSize size = [_tipCount textSizeIn:CGSizeMake(rect.size.width, 20)];
    if (size.width < 20)
    {
        size.width = 20;
    }
    else
    {
        size.width += kDefaultMargin * 2;
    }
    size.height = 20;
    [_tipCount sizeWith:size];
    
    [_tipCount layoutParentVerticalCenter];
    [_tipCount alignParentRight];
    
}

@end
#endif