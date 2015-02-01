//
//  SellerFoodTypeView.h
//  iLunch
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SellerFoodTypeView : ScrollIndexView
{
    UILabel *_type;
    MenuButton *_more;
}

- (instancetype)initWithMenus:(NSArray *)array moreAction:(CommonBlock)action;

- (void)addMenu:(MenuItem *)item;

@end
