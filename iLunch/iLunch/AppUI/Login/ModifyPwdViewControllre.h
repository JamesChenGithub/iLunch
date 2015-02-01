//
//  ModifyPwdViewControllre.h
//  iLunch
//
//  Created by James on 15-1-19.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface ModifyPwdViewControllre : BaseViewController
{
    UIButton *_backButton;
    UILabel *_titleLabel;
    
    UITextField *_pwd;
    UILabel *_pwdTip;
    
    UITextField *_newPwd;
    UILabel *_newPwdTip;
    
    UITextField *_confirmPwd;
    UILabel *_confirmPwdTip;
    
    UIButton *_confirmModify;
    
    
}

@end
