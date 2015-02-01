//
//  SellerInfoView.h
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import <UIKit/UIKit.h>

@interface SellerInfoView : UIView
{
    MenuButton *_addButton;
    UILabel  *_addTip;
}

- (void)setClickAdd:(MenuAction)action;

@end


@interface FoodInfoView : SellerInfoView

@end

#endif