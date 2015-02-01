//
//  SellerFoodTypeView.m
//  iLunch
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "SellerFoodTypeView.h"

@interface SellerFoodTypeView ()

@property (nonatomic, copy) CommonBlock moreAction;

@end

@implementation SellerFoodTypeView

- (void)addLine
{
    
}


- (void)addMenu:(MenuItem *)item
{
    if (item)
    {
        if (!_menuButtons) {
            _menuButtons = [NSMutableArray array];
        }
        if (!_menus)
        {
            _menus = [NSMutableArray array];
        }
        
        [_menus addObject:item];
        [self createWith:item needLine:NO];
        
        [self relayoutFrameOfSubViews];
    }
}

- (instancetype)initWithMenus:(NSArray *)array moreAction:(CommonBlock)action
{
    if (self = [super initWithMenus:array])
    {
        self.moreAction = action;
    }
    return self;
}

- (void)addOwnViews
{
    _type = [[UILabel alloc] init];
    _type.font = [UIFont systemFontOfSize:14];
    _type.text = @"品类：";
    _type.textColor = kMainTextColor;
    [self addSubview:_type];
    
    [super addOwnViews];

    _scrollView.backgroundColor = kClearColor;

    
    __weak typeof(self) ws = self;
    _more = [[MenuButton alloc] initWithTitle:nil icon:[UIImage imageNamed:@"menu_icon_all.png"] action:^(id<MenuAbleItem> menu) {
        if (ws.moreAction)
        {
            ws.moreAction(ws);
        }
    }];
    [_more setBackgroundImage:[UIImage imageNamed:@"pic_bg.png"] forState:UIControlStateNormal];
    [self addSubview:_more];
}

- (void)relayoutFrameOfSubViews
{
    CGRect bounds = self.bounds;
    [_more sizeWith:CGSizeMake(bounds.size.height, bounds.size.height)];
    [_more alignParentRight];
    
    [_type sameWith:_more];
    [_type alignParentLeft];
    
    bounds = CGRectInset(bounds, bounds.size.height, 0);
    [self relayoutScrollView:bounds];
}

@end
