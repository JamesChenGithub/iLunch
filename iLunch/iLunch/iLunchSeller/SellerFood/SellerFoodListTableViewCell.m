//
//  SellerFoodListTableViewCell.m
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerFoodListTableViewCell.h"

@implementation SellerFoodListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addOwnViews];
        [self configOwnViews];
        self.backgroundColor = kClearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)addOwnViews
{
    _foodPanel = [[UIView alloc] init];
    _foodPanel.backgroundColor = RGB(250, 250, 250);
    [self.contentView addSubview:_foodPanel];
    
    _foodIcon = [[UIImageView alloc] init];
    [_foodPanel addSubview:_foodIcon];
    
    _foodName = [[UILabel alloc] init];
    _foodName.font = [UIFont systemFontOfSize:14];
    _foodName.textColor = kMainTextColor;
    _foodName.textAlignment = NSTextAlignmentLeft;
    [_foodPanel addSubview:_foodName];
    
    _foodPrice = [[UILabel alloc] init];
    _foodPrice.font = [UIFont systemFontOfSize:13];
    _foodPrice.textColor = kMainTextColor;
    _foodPrice.textAlignment = NSTextAlignmentLeft;
    [_foodPanel addSubview:_foodPrice];
    
    _online = [[UIButton alloc] init];
    _online.titleLabel.font = [UIFont systemFontOfSize:13];
    [_foodPanel addSubview:_online];
    
    _state = [[UIButton alloc] init];
    _state.titleLabel.font = [UIFont systemFontOfSize:13];
    [_foodPanel addSubview:_state];
}

- (void)configOwnViews
{
    _foodIcon.backgroundColor = kRandomFlatColor;
    _foodName.text = @"越南牛肉汤粉";
    
    NSString *price = @"￥15";
    NSString *unit = @"/份";
    
    NSString *info = [NSString stringWithFormat:@"%@%@", price, unit];
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:info];
    
    [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, price.length)];
    [attriString addAttribute:NSForegroundColorAttributeName value:kPriceTextColor range:NSMakeRange(0, price.length)];
    [attriString addAttribute:NSForegroundColorAttributeName value:kMainTextColor range:NSMakeRange(price.length, unit.length)];
    [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(price.length, unit.length)];
    
    _foodPrice.attributedText = attriString;
    
    [_online setTitle:@"上线" forState:UIControlStateNormal];
    [_online setBackgroundImage:[UIImage imageNamed:@"but_online.png"] forState:UIControlStateNormal];
    [_online setTitleColor:kBlackColor forState:UIControlStateNormal];
    
    [_state setTitle:@"正常" forState:UIControlStateNormal];
    [_state setBackgroundImage:[UIImage imageNamed:@"but_normal"] forState:UIControlStateNormal];
    [_state setTitleColor:kThemeColor forState:UIControlStateNormal];
    
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.contentView.bounds;
    rect = CGRectInset(rect, kDefaultMargin, 0);
    rect.origin.y += kDefaultMargin;
    rect.size.height -= kDefaultMargin;
    
    _foodPanel.frame = rect;
    
    rect = _foodPanel.bounds;
    
    [_foodIcon sizeWith:CGSizeMake(rect.size.height - 2 * 5, rect.size.height - 2 * 5)];
    [_foodIcon layoutParentVerticalCenter];
    [_foodIcon alignParentLeftWithMargin:5];
    
    [_foodName sizeWith:CGSizeMake(rect.size.width, 25)];
    [_foodName alignTop:_foodIcon];
    [_foodName layoutToRightOf:_foodIcon margin:kDefaultMargin];
    [_foodName scaleToParentRightWithMargin:kDefaultMargin];
    
    
    [_foodPrice sizeWith:CGSizeMake(_foodName.bounds.size.width/2, 25)];
    [_foodPrice layoutBelow:_foodName];
    [_foodPrice alignLeft:_foodName];
    
    [_state sizeWith:[_state backgroundImageForState:UIControlStateNormal].size];
    [_state alignParentRightWithMargin:kDefaultMargin];
    [_state alignParentBottomWithMargin:kDefaultMargin];
    
    [_online sameWith:_state];
    [_online layoutToLeftOf:_state margin:2*kDefaultMargin];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}
@end
#endif