//
//  SellerEmptyViewController.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//
#if kIsILunchSeller
#import "BaseViewController.h"

@interface SellerEmptyViewController : BaseViewController
{
    UIImageView *_imageView;
    UILabel *_emptyTip;
}

- (void)setTip:(NSString *)string;

@end
#endif