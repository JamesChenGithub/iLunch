//
//  SellerFoodSearchView.h
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import <UIKit/UIKit.h>

@class SellerFoodSearchView;

@protocol SellerFoodSearchViewDelegate <NSObject>

- (void)onSearchView:(SellerFoodSearchView *)bar searchText:(NSString *)search;

@end

@interface SellerFoodSearchView : UIView<UITextFieldDelegate>
{
    UITextField *_search;
    UIView *_searchLine;
}

@property (nonatomic, weak) id<SellerFoodSearchViewDelegate> delegate;

@end
#endif