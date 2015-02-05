//
//  SellerEmptyViewController.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerEmptyViewController.h"

@interface SellerEmptyViewController ()

@end

@implementation SellerEmptyViewController


- (void)addOwnViews
{
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"ilunch_logo"];
    [self.view addSubview:_imageView];
    
    _emptyTip = [[UILabel alloc] init];
    _emptyTip.textAlignment = NSTextAlignmentCenter;
    _emptyTip.textColor = kLightGrayColor;
    _emptyTip.font = [UIFont systemFontOfSize:12];
    _emptyTip.numberOfLines = 0;
    _emptyTip.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:_emptyTip];
}

- (void)setTip:(NSString *)string
{
    _emptyTip.text = string;
    [self layoutSubviewsFrame];
}


- (void)layoutOnIPhone
{
    [_imageView sizeWith:_imageView.image.size];
    [_imageView layoutParentHorizontalCenter];
    [_imageView alignParentTopWithMargin:150];
    
    CGSize size = [_emptyTip textSizeIn:CGSizeMake(self.view.bounds.size.width - 150, HUGE_VAL)];
    size.width += 2;
    size.height += 2;
    [_emptyTip sizeWith:size];
    [_emptyTip layoutParentHorizontalCenter];
    [_emptyTip layoutBelow:_imageView margin:10];
}

@end
#endif