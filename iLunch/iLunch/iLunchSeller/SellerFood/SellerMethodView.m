//
//  SellerMethodView.m
//  iLunch
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "SellerMethodView.h"

@implementation SellerMethodView

- (void)addOwnViews
{
    _method = [[UILabel alloc] init];
    _method.font = [UIFont systemFontOfSize:14];
    _method.textColor = kMainTextColor;
    [self addSubview:_method];
    
    UIImage *uncheck = [UIImage imageNamed:@"unchecked"];
    UIImage *check = [UIImage imageNamed:@"checked"];
    
    _order = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    _order.imageSize = uncheck.size;
    _order.padding = CGSizeMake(2, 2);
    _order.titleLabel.font = [UIFont systemFontOfSize:14];
    [_order setImage:uncheck forState:UIControlStateNormal];
    [_order setImage:check forState:UIControlStateSelected];
    [_order setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [_order setTitle:@"订座" forState:UIControlStateNormal];
    [self addSubview:_order];
    
    _pack = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    _pack.imageSize = uncheck.size;
    _pack.padding = CGSizeMake(2, 2);
    _pack.titleLabel.font = [UIFont systemFontOfSize:14];
    [_pack setImage:uncheck forState:UIControlStateNormal];
    [_pack setImage:check forState:UIControlStateSelected];
    [_pack setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [_pack setTitle:@"打包" forState:UIControlStateNormal];
    [self addSubview:_pack];
    
    _book = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter];
    _book.imageSize = uncheck.size;
    _book.padding = CGSizeMake(2, 2);
    _book.titleLabel.font = [UIFont systemFontOfSize:14];
    [_book setImage:uncheck forState:UIControlStateNormal];
    [_book setImage:check forState:UIControlStateSelected];
    [_book setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [_book setTitle:@"外卖" forState:UIControlStateNormal];
    [self addSubview:_book];
    
    self.backgroundColor = kClearColor;
}

- (void)configOwnViews
{
    _method.text = @"销售方式";
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.bounds;
    
    [_method sizeWith:CGSizeMake(rect.size.width - 2 * kDefaultMargin, 35)];
    [_method layoutParentHorizontalCenter];
    
    rect = CGRectInset(rect, kDefaultMargin, 0);
    rect.origin.y += 35;
    rect.size.height -= 35;
    
    [self alignSubviews:@[_order, _pack, _book] horizontallyWithPadding:0 margin:0 inRect:rect];
}

- (void)drawRect:(CGRect)rect
{
    [self addBottomLine:rect];
}

@end
