//
//  MainBookViewController.h
//  iLunch
//
//  Created by James on 15-1-6.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface MainBookViewController : TableRefreshViewController
{
    HeaderTitleView         *_buildTitle;
    ScrollIndexMoreView     *_foodIndex;
    ShoppingCartView        *_shoppingCart;
    
    FoodPanel               *_foodPanel;
    ShoppingListView        *_shoppingList;
    
}

@end


@interface MainBookViewController (BookBusiness)

- (void)chooseMyBuilding;


@end