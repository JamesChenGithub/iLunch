//
//  SellerFoodListTableViewCell.h
//  iLunch
//
//  Created by James on 15-1-21.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import <UIKit/UIKit.h>

@interface SellerFoodListTableViewCell : UITableViewCell
{
    UIView *_foodPanel;
    UIImageView *_foodIcon;
    UILabel *_foodName;
    UILabel *_foodPrice;
    
    UIButton *_online;
    UIButton *_state;
}

@end
#endif