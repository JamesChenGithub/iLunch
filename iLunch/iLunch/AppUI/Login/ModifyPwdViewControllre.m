//
//  ModifyPwdViewControllre.m
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "ModifyPwdViewControllre.h"

@interface ModifyPwdViewControllre ()

@end

@implementation ModifyPwdViewControllre


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
    _pwd = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_password.png"]];
    _pwd.secureTextEntry = YES;
    [self.view addSubview:_pwd];
    
    _pwdTip = [[UILabel alloc] init];
    _pwdTip.textColor = kOrangeColor;
    _pwdTip.font = [UIFont systemFontOfSize:12];
    _pwdTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_pwdTip];
    
    _newPwd = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_passok.png"]];
    _newPwd.secureTextEntry = YES;
    [self.view addSubview:_newPwd];
    
    _newPwdTip = [[UILabel alloc] init];
    _newPwdTip.textColor = kOrangeColor;
    _newPwdTip.font = [UIFont systemFontOfSize:12];
    _newPwdTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_newPwdTip];
    
    _confirmPwd = [[UITextField alloc] initLeftIconWith:[UIImage imageNamed:@"icon_passok.png"]];
    _confirmPwd.secureTextEntry = YES;
    [self.view addSubview:_confirmPwd];
    
    _confirmPwdTip = [[UILabel alloc] init];
    _confirmPwdTip.textColor = kOrangeColor;
    _confirmPwdTip.font = [UIFont systemFontOfSize:12];
    _confirmPwdTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_confirmPwdTip];
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
    
    
    [self addInputs];
    
    
    _confirmModify = [[UIButton alloc] init];
    [_confirmModify setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_confirmModify setTitle:@"确认修改" forState:UIControlStateNormal];
    [_confirmModify setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self.view addSubview:_confirmModify];
    
}

- (void)configOwnViews
{
    _titleLabel.text = @"修改密码";
    
    _pwd.placeholder = @"请输入你的密码";
    _pwdTip.text = _pwd.placeholder;
    
    _newPwd.placeholder = @"请输入新密码";
    _newPwdTip.text = _newPwd.placeholder;
    
    _confirmPwd.placeholder = @"请确认你的新密码";
    _confirmPwdTip.text = _confirmPwd.placeholder;
    

    
}

- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    
    [_backButton sizeWith:CGSizeMake(44, 44)];
    [_backButton alignParentTopWithMargin:20];
    
    [_titleLabel sizeWith:CGSizeMake(size.width, 35)];
    [_titleLabel layoutBelow:_backButton];

    [_pwd sizeWith:CGSizeMake(size.width - 64, 35)];
    [_pwd layoutParentHorizontalCenter];
    [_pwd layoutBelow:_titleLabel margin:25];
    
    [_pwdTip sizeWith:CGSizeMake(size.width - 64, 15)];
    [_pwdTip layoutParentHorizontalCenter];
    [_pwdTip layoutBelow:_pwd];
    
    [_newPwd sameWith:_pwd];
    [_newPwd layoutBelow:_pwd margin:35];
    
    [_newPwdTip sameWith:_pwdTip];
    [_newPwdTip layoutBelow:_newPwd];
    
    [_confirmPwd sameWith:_newPwd];
    [_confirmPwd layoutBelow:_newPwd margin:35];
    
    [_confirmPwdTip sameWith:_newPwdTip];
    [_confirmPwdTip layoutBelow:_confirmPwd];
    
    
    [_confirmModify sizeWith:CGSizeMake(size.width, kBottomButtonHeight)];
    [_confirmModify alignParentBottom];
    
}

@end
