//
//  MineLoginView.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MineLoginView.h"


@implementation MineLoginView

- (instancetype)initWith:(id<UserLoginAble>)user
{
    if (self = [super initWithFrame:CGRectZero])
    {
        _user = user;
        [self addOwnViews];
        [self configOwnViews];
    }
    return self;
}
- (void)addOwnViews
{
    _backView = [[UIImageView alloc] init];
    [self addSubview:_backView];
    
    _loginButton = [[UIButton alloc] init];
    [_loginButton addTarget:self action:@selector(onLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginButton];
    
    _loginTip = [UILabel centerlabelWith:nil];
    [self addSubview:_loginTip];
    
    _settingButton = [[UIButton alloc] init];
    [_settingButton setImage:kMineLoginView_Setting_Icon forState:UIControlStateNormal];
    [_settingButton addTarget:self action:@selector(onSetting) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_settingButton];
}

- (void)onLogin:(UIButton *)login
{
    QuickLoginViewController *vc = [[QuickLoginViewController alloc] init];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:vc];
    [[AppDelegate sharedAppDelegate].topViewController presentViewController:nav animated:YES completion:nil];
}

- (void)onSetting
{
#if kIsILunchSeller
    SellerSettingViewController *sv = [NSObject loadClass:[SellerSettingViewController class]];
    [[AppDelegate sharedAppDelegate] pushViewController:sv];
#else
    MineSettingViewController *msv = [NSObject loadClass:[MineSettingViewController class]];
    [[AppDelegate sharedAppDelegate] pushViewController:msv];
#endif
}

- (void)configOwnViews
{
    _backView.image = kMineLoginView_BG_Icon;
    
    if ([_user isLogined])
    {
        UIImage *icon = [_user userIcon];
        [_loginButton setImage:icon forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = icon.size.width/2;
        _loginButton.layer.borderWidth = 2;
        _loginButton.layer.borderColor = kLightGrayColor.CGColor;
        _loginTip.text = [_user userName];
        _loginTip.textColor = kWhiteColor;
    }
    else
    {
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_login00"] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_login01"] forState:UIControlStateHighlighted];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
#if kIsILunchSeller
#else
        _loginTip.text = @"请登录体验更多功能";
#endif
        _loginTip.textColor = kWhiteColor;
    }
}

- (void)relayoutFrameOfSubViews
{
    _backView.frame = self.bounds;
    
    if ([_user isLogined])
    {
        UIImage *icon = [_loginButton imageForState:UIControlStateNormal];
        [_loginButton sizeWith:icon.size];
    }
    else
    {
        UIImage *bg = [_loginButton backgroundImageForState:UIControlStateNormal];
        [_loginButton sizeWith:bg.size];
    }
    [_loginButton layoutParentCenter];
    
    [_loginTip sizeWith:CGSizeMake(self.bounds.size.width, 20)];
    [_loginTip layoutBelow:_loginButton margin:10];
    
    UIImage *set = [_settingButton imageForState:UIControlStateNormal];
    [_settingButton sizeWith:set.size];
    
    [_settingButton alignParentTopWithMargin:30];
    [_settingButton alignParentRightWithMargin:10];
}




@end
