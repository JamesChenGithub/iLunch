//
//  iLunchLoginViewcontroller.m
//  iLunch
//
//  Created by James on 15-1-12.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "iLunchLoginViewcontroller.h"

@implementation iLunchLoginViewcontroller

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_account resignFirstResponder];
    [_passwd resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)addBackItem
{
    
}

- (void)goBack
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)addInputs
{
    _account = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_user.png"]];
    _account.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_account];
    
    _passwd = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_password.png"]];
    _passwd.secureTextEntry = YES;
    _passwd.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_passwd];
}

- (void)addOwnViews
{
    
    UIImage *bicon = [kNav_Back_Icon imageWithTintColor:kBlackColor];
    _backButton = [[UIButton alloc] init];
    [_backButton setImage:bicon forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:25];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = kMainTextColor;
    [self.view addSubview:_titleLabel];
    
    _subtitleLabel = [[UILabel alloc] init];
    _subtitleLabel.font = [UIFont systemFontOfSize:18];
    _subtitleLabel.textAlignment = NSTextAlignmentCenter;
    _subtitleLabel.textColor = kMainTextColor;
    [self.view addSubview:_subtitleLabel];
    
    [self addInputs];
    
    
    _login = [[UIButton alloc] init];
    [_login setBackgroundImage:[UIImage imageNamed:@"btn_login00_b.png"] forState:UIControlStateNormal];
    [_login setBackgroundImage:[UIImage imageNamed:@"btn_login01_b.png"] forState:UIControlStateHighlighted];
    [_login setTitle:@"登录" forState:UIControlStateNormal];
    [_login setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self.view addSubview:_login];
    
    _loginTip = [[UILabel alloc] init];
    _loginTip.font = [UIFont systemFontOfSize:14];
    _loginTip.textAlignment = NSTextAlignmentCenter;
    _loginTip.textColor = kMainTextColor;
    [self.view addSubview:_loginTip];
    
    _wechatLogin = [[UIButton alloc] init];
    [_wechatLogin setImage:[UIImage imageNamed:@"logo_wechat.png"] forState:UIControlStateNormal];
    [self.view addSubview:_wechatLogin];
    
    _qqLogin = [[UIButton alloc] init];
    [_qqLogin setImage:[UIImage imageNamed:@"logo_qq.png"] forState:UIControlStateNormal];
    [self.view addSubview:_qqLogin];
    
}

- (void)configOwnViews
{
    _titleLabel.text = @"欢迎使用";
    _subtitleLabel.text = @"爱午餐";
    
    _account.placeholder = @"请输入用户名或邮箱";
    _passwd.placeholder = @"请输入密码";
    
    _loginTip.text = @"还可以用以下网站登录";
}

- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    
    [_backButton sizeWith:CGSizeMake(44, 44)];
    [_backButton alignParentTopWithMargin:20];
    
    [_titleLabel sizeWith:CGSizeMake(size.width, 35)];
    [_titleLabel layoutBelow:_backButton];
    
    [_subtitleLabel sizeWith:CGSizeMake(size.width, 25)];
    [_subtitleLabel layoutBelow:_titleLabel margin:10];
    
    [_account sizeWith:CGSizeMake(size.width - 64, 35)];
    [_account layoutParentHorizontalCenter];
    [_account layoutBelow:_subtitleLabel margin:25];
    
    [_passwd sameWith:_account];
    [_passwd layoutBelow:_account margin:30];
    
    [_login sizeWith:[_login backgroundImageForState:UIControlStateNormal].size];
    [_login layoutParentHorizontalCenter];
    [_login layoutBelow:_passwd margin:25];
    
    
    NSInteger resetHeight = size.height - (_login.frame.origin.y + _login.frame.size.height);
    
    NSInteger margin = (resetHeight - 80)/2;
    
    [_loginTip sizeWith:CGSizeMake(size.width, 26)];
    [_loginTip layoutParentHorizontalCenter];
    [_loginTip layoutBelow:_login margin:margin];
    
    
    UIImage *icon = [_wechatLogin imageForState:UIControlStateNormal];
    [_wechatLogin sizeWith:icon.size];
    [_wechatLogin layoutParentHorizontalCenter];
    [_wechatLogin layoutBelow:_loginTip margin:10];
    [_wechatLogin move:CGPointMake(-(15 + icon.size.width/2), 0)];
    
    [_qqLogin sameWith:_wechatLogin];
    [_qqLogin layoutToRightOf:_wechatLogin margin:30];
    
    
}

@end
