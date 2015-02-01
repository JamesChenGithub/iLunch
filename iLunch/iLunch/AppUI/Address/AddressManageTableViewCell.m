//
//  AddressManageTableViewCell.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddressManageTableViewCell.h"

@implementation AddressManageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _title = [UILabel label];
        _title.textColor = kMainTextColor;
        [self.contentView addSubview:_title];
        
        _tipView = [[UIImageView alloc] init];
        _tipView.image = kAddressManage_Cell_Tip_Icon;
        [self.contentView addSubview:_tipView];
        
//        CellMoreMenuItem *item = [[CellMoreMenuItem alloc] initIcon:[UIImage imageNamed:@"btn_com"] backColor:kRedColor action:^(id<MenuAbleItem> menu) {
//            
//        }];
//        
//        [self addMoreMenus:@[item]];
    }
    return self;
}

- (void)relayoutFrameOfSubViews
{
    [_tipView sizeWith:_tipView.image.size];
    [_tipView layoutParentVerticalCenter];
    [_tipView alignParentRightWithMargin:10];
    

    [_title sizeWith:CGSizeMake(100, self.contentView.bounds.size.height)];
    [_title layoutToLeftOf:_tipView margin:10];
    
    [_title scaleToParentLeftWithMargin:10];
    [self relayoutMenuButtons];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

@end
