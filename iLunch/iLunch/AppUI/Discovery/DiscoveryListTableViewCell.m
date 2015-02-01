//
//  DiscoveryListTableViewCell.m
//  iLunch
//
//  Created by James on 15-1-11.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "DiscoveryListTableViewCell.h"

@implementation DiscoveryListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addOwnViews];
        [self configOwnViews];
    }
    return self;
}

+ (UIFont *)shareFont
{
    return [UIFont systemFontOfSize:13];
}

- (void)addOwnViews
{
    _panel = [[UIView alloc] init];
    _panel.backgroundColor = kAppBakgroundColor;
    [self.contentView addSubview:_panel];
    
    _userIcon = [[UIImageView alloc] init];
    _userIcon.layer.cornerRadius = 20;
    [_panel addSubview:_userIcon];
    
    _userName = [[UILabel alloc] init];
    _userName.textColor = kMainTextColor;
    _userName.textAlignment = NSTextAlignmentLeft;
    [_panel addSubview:_userName];
    
    _hourAgo = [[UILabel alloc] init];
    _hourAgo.textColor = kDetailTextColor;
    _hourAgo.font = [UIFont systemFontOfSize:14];
    _hourAgo.textAlignment = NSTextAlignmentRight;
    [_panel addSubview:_hourAgo];
    
    _share = [[UILabel alloc] init];
    _share.numberOfLines = 0;
    _share.lineBreakMode = NSLineBreakByWordWrapping;
    _share.textColor = kDetailTextColor;
    _share.font = [DiscoveryListTableViewCell shareFont];
    [_panel addSubview:_share];
    
    
    _line = [[UIImageView alloc] init];
    _line.backgroundColor = kLightGrayColor;
    [_panel addSubview:_line];
    
    _shopName = [[UILabel alloc] init];
    _shopName.textColor = kDetailTextColor;
    _shopName.textAlignment = NSTextAlignmentLeft;
    _shopName.font = [DiscoveryListTableViewCell shareFont];
    [_panel addSubview:_shopName];
    
    _shopAddress = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft];
    _shopAddress.margin = UIEdgeInsetsZero;
    _shopAddress.padding = CGSizeMake(0, 0);
    _shopAddress.titleLabel.textAlignment = NSTextAlignmentLeft;
    _shopAddress.titleLabel.font = [DiscoveryListTableViewCell shareFont];
    UIImage *icon = [UIImage imageNamed:@"icon_place1.png"];
    _shopAddress.imageSize = icon.size;
    [_shopAddress setImage:icon forState:UIControlStateNormal];
    [_shopAddress setTitleColor:kDetailTextColor forState:UIControlStateNormal];
    [_panel addSubview:_shopAddress];
    
    _shopContact = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft];
    _shopContact.margin = UIEdgeInsetsZero;
    _shopContact.padding = CGSizeMake(0, 0);
    _shopContact.titleLabel.textAlignment = NSTextAlignmentLeft;
    _shopContact.titleLabel.font = [DiscoveryListTableViewCell shareFont];
    icon = [UIImage imageNamed:@"icon_tel.png"];
    _shopContact.imageSize = icon.size;
    [_shopContact setImage:icon forState:UIControlStateNormal];
    [_shopContact setTitleColor:kDetailTextColor forState:UIControlStateNormal];
    [_panel addSubview:_shopContact];
    
}

- (void)configOwnViews
{
    _userIcon.backgroundColor = kRandomFlatColor;
    _userName.text = @"James Chen";
    _hourAgo.text = @"1小时前";
    
    _shopName.text = @"西丽珠光村";
    [_shopAddress setTitle:@"跳跳蛙" forState:UIControlStateNormal];
    [_shopContact setTitle:@"020-12121233" forState:UIControlStateNormal];
}

- (void)configWith:(NSString *)text
{
    _share.text = text;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}


#define kShopLineHeight 24

+ (CGFloat)heightOf:(NSString *)share
{
    NSInteger shareInfoWidth = kMainScreenWidth - 2*kDefaultMargin - 5 - 40;
    
    NSLineBreakMode breakMode = NSLineBreakByWordWrapping;
    UIFont *font = [DiscoveryListTableViewCell shareFont];
    
    CGSize contentSize = CGSizeZero;

    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = breakMode;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle};
    contentSize = [share boundingRectWithSize:CGSizeMake(shareInfoWidth, HUGE_VAL) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    
    
    contentSize = CGSizeMake((int)contentSize.width + 1, (int)contentSize.height + 1);
    
    if (contentSize.height < 20 ) {
        contentSize.height = 20;
    }
    
    return 10 + kDefaultMargin + 20 + contentSize.height + kDefaultMargin + kShopLineHeight * 3 + 2;
}


- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.contentView.bounds;
    rect.origin.y += 10;
    rect.size.height -= 10;
    
    _panel.frame = rect;
    
    rect = _panel.bounds;
    
    [_shopContact sizeWith:CGSizeMake(rect.size.width - 20 * 2, kShopLineHeight)];
    [_shopContact layoutParentHorizontalCenter];
    [_shopContact alignParentBottom];
    
    
    [_shopAddress sameWith:_shopContact];
    [_shopAddress layoutAbove:_shopContact];
    
    [_shopName sameWith:_shopAddress];
    [_shopName layoutAbove:_shopAddress];
    
    [_line sizeWith:CGSizeMake(rect.size.width - kDefaultMargin * 2, 1)];
    [_line layoutParentHorizontalCenter];
    [_line layoutAbove:_shopName];
    
    
    [_userIcon sizeWith:CGSizeMake(40, 40)];
    [_userIcon alignParentTopWithMargin:kDefaultMargin];
    [_userIcon alignParentLeftWithMargin:kDefaultMargin];
    
    NSInteger shareInfoWidth = kMainScreenWidth - 2*8 - 5 - 40;
    [_userName sizeWith:CGSizeMake(shareInfoWidth * 3/4, 20)];
    [_userName alignTop:_userIcon];
    [_userName layoutToRightOf:_userIcon margin:5];
    
    [_hourAgo sizeWith:CGSizeMake(shareInfoWidth/4, 20)];
    [_hourAgo alignTop:_userName];
    [_hourAgo layoutToRightOf:_userName];
    
    [_share sizeWith:CGSizeMake(shareInfoWidth, 20)];
    [_share alignLeft:_userName];
    [_share layoutBelow:_userName];
    [_share scaleToAboveOf:_line margin:kDefaultMargin];
    
}

@end
