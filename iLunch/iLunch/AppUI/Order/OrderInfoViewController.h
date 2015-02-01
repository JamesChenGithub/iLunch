//
//  OrderInfoViewController.h
//  iLunch
//
//  Created by James on 15-1-10.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderInfoViewController : BaseViewController
{
    ImageTitleButton *_lunchTime;
    ImageTitleButton *_orderNum;
    
    UIImageView *_orderFrom;
    UILabel     *_waitTip;
}

@end
