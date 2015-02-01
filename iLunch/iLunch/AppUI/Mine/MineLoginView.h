//
//  MineLoginView.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineLoginView : UIView
{
@protected
    
    UIImageView *_backView;
    UIButton    *_loginButton;

    UILabel     *_loginTip;

    UIButton    *_settingButton;
    
    id<UserLoginAble> _user;
}

- (instancetype)initWith:(id<UserLoginAble>)user;


@end
