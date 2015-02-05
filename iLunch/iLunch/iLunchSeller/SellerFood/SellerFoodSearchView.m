//
//  SellerFoodSearchView.m
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "SellerFoodSearchView.h"

@implementation SellerFoodSearchView

- (void)addOwnViews
{
    UIButton *searchButton = [[UIButton alloc] init];
    UIImage *img = [UIImage imageNamed:@"btn_search1"];
    [searchButton setImage:img forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(onSearch:) forControlEvents:UIControlEventTouchUpInside];
    searchButton.frame = CGRectFromCGSize(img.size);
    
    _search = [[UITextField alloc] init];
    _search.delegate = self;
    _search.rightViewMode = UITextFieldViewModeAlways;
    _search.returnKeyType = UIReturnKeySearch;
    _search.rightView = searchButton;
    _search.placeholder = @"搜索我的餐品";
    [self addSubview:_search];
    
    _searchLine = [[UIView alloc] init];
    _searchLine.backgroundColor = kLightGrayColor;
    [self addSubview:_searchLine];
    
    self.backgroundColor = kWhiteColor;
    
}



- (void)configOwnViews
{
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self onSearch:nil];
    return YES;
}

- (void)onSearch:(UIButton *)button
{
    [_search resignFirstResponder];
    
    if (![NSString isEmpty:_search.text])
    {
        if ([_delegate respondsToSelector:@selector(onSearchView:searchText:)])
        {
            [_delegate onSearchView:self searchText:_search.text];
        }
    }
    
    
}


- (void)relayoutFrameOfSubViews
{
    [_search sizeWith:CGSizeMake(self.bounds.size.width - 24, 30)];
    [_search layoutParentCenter];
    
    [_searchLine sizeWith:CGSizeMake(_search.bounds.size.width, 1)];
    [_searchLine layoutBelow:_search margin:1];
    [_searchLine alignLeft:_search];
}

@end
#endif