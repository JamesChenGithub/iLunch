//
//  QuickLoginViewController.m
//  iLunch
//
//  Created by James on 15-1-12.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "QuickLoginViewController.h"

@implementation QuickLoginViewController

- (void)addInputs
{
    _account = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_phone.png"]];
    _account.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_account];
    
    UIButton *code = [[UIButton alloc] init];
    UIImage *icon = [UIImage imageNamed:@"btn_d_password00.png"];
    [code setBackgroundImage:icon forState:UIControlStateNormal];
    [code setTitle:@"发送动态验证码" forState:UIControlStateNormal];
    [code setTitleColor:kWhiteColor forState:UIControlStateNormal];
    code.titleLabel.font = [UIFont systemFontOfSize:9];
    code.frame = CGRectFromCGSize(icon.size);
    
    _passwd = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_password.png"]];
    _passwd.secureTextEntry = YES;
    _passwd.rightViewMode = UITextFieldViewModeAlways;
    _passwd.rightView = code;
    _passwd.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_passwd];
}

- (void)addOwnViews
{
    [super addOwnViews];
    
    [_subtitleLabel removeFromSuperview];
    _subtitleLabel = nil;
    
    _accountTip = [[UILabel alloc] init];
    _accountTip.textColor = kPriceTextColor;
    _accountTip.font = [UIFont systemFontOfSize:12];
    _accountTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_accountTip];
    
    _passwdTip = [[UILabel alloc] init];
    _passwdTip.textColor = kPriceTextColor;
    _passwdTip.font = [UIFont systemFontOfSize:12];
    _passwdTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_passwdTip];
    
    
    _forgetpwd = [[UIButton alloc] init];
    [_forgetpwd setBackgroundImage:[UIImage imageNamed:@"btn_revise00.png"] forState:UIControlStateNormal];
    [_forgetpwd setBackgroundImage:[UIImage imageNamed:@"btn_revise01.png"] forState:UIControlStateHighlighted];
    [_forgetpwd setTitle:@"修改密码" forState:UIControlStateNormal];
    [_forgetpwd setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [self.view addSubview:_forgetpwd];
    
    _ilunchLogin = [[UIButton alloc] init];
    [_ilunchLogin setImage:[UIImage imageNamed:@"logo_ilunch.png"] forState:UIControlStateNormal];
    [_ilunchLogin addTarget:self action:@selector(onLunchLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ilunchLogin];
}

- (void)onLunchLogin
{
    [self.navigationController pushViewController:[NSObject loadClass:[iLunchLoginViewcontroller class]] animated:NO];
}

- (void)configOwnViews
{
    _titleLabel.text = @"快捷登录";
    _account.placeholder = @"请输入手机号";
    _accountTip.text = @"手机号未注册将自动产生爱午餐帐号";
    _passwd.placeholder = @"请输入动态验证码";
    _passwdTip.text = @"默认密码是动态码，可点击\"修改密码\"";
    _loginTip.text = @"还可以用以下网站登录";
}

- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    
    [_backButton sizeWith:CGSizeMake(44, 44)];
    [_backButton alignParentTopWithMargin:20];
    
    [_titleLabel sizeWith:CGSizeMake(size.width, 35)];
    [_titleLabel layoutBelow:_backButton];
    
    [_account sizeWith:CGSizeMake(size.width - 64, 35)];
    [_account layoutParentHorizontalCenter];
    [_account layoutBelow:_titleLabel margin:30];
    
    [_accountTip sizeWith:CGSizeMake(size.width - 64, 15)];
    [_accountTip layoutParentHorizontalCenter];
    [_accountTip layoutBelow:_account];
    
    [_passwd sameWith:_account];
    [_passwd layoutBelow:_account margin:25];
    
    [_passwdTip sameWith:_accountTip];
    [_passwdTip layoutBelow:_passwd];
    
    [_forgetpwd sizeWith:[_forgetpwd backgroundImageForState:UIControlStateNormal].size];
    [_forgetpwd layoutParentHorizontalCenter];
    [_forgetpwd layoutBelow:_passwdTip margin:10];
    
    [_login sameWith:_forgetpwd];
    [_login layoutBelow:_forgetpwd margin:10];
    
    
    NSInteger resetHeight = size.height - (_login.frame.origin.y + _login.frame.size.height);
    
    NSInteger margin = (resetHeight - 80)/2;
    
    [_loginTip sizeWith:CGSizeMake(size.width, 26)];
    [_loginTip layoutParentHorizontalCenter];
    [_loginTip layoutBelow:_login margin:margin];
    
    
    UIImage *icon = [_qqLogin imageForState:UIControlStateNormal];
    [_qqLogin sizeWith:icon.size];
    [_qqLogin layoutParentHorizontalCenter];
    [_qqLogin layoutBelow:_loginTip margin:10];

    [_wechatLogin sameWith:_qqLogin];
    [_wechatLogin layoutToLeftOf:_qqLogin margin:30];
    
    [_ilunchLogin sameWith:_qqLogin];
    [_ilunchLogin layoutToRightOf:_qqLogin margin:30];
    
    
    
    
}

@end
