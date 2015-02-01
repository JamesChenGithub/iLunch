//
//  SelllerAddFoodViewController.h
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SelllerAddFoodViewController : BaseViewController
{
    UIScrollView *_scrollView;
    
    FoodInfoView *_addFood;
    
    UIView       *_editView;
    
    TextFieldLine *_foodName;
    
    TextFieldLine *_foodPrice;
    
    SellerMethodView *_method;
    SellerFoodTypeView *_type;
    
    FoodPanel *_foodPanel;
    
    
    
    UIButton    *_commit;
    UIView      *_line;
    UIButton    *_continueAdd;
}

@end
#endif