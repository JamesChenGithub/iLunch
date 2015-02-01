//
//  LunchTimeSettingView.m
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "LunchTimeSettingView.h"

@implementation LunchTimeSettingView

- (instancetype)initActionSheetStyle
{
    if (self = [super initWithFrame:CGRectZero])
    {
        _isActionSheetStyle = YES;
        [self addOwnViews];
        [self configOwnViews];
    }
    return self;
}

- (void)addOwnViews
{
    if (_isActionSheetStyle)
    {
        _fadeView = [[UIView alloc] init];
        [self addSubview:_fadeView];
    }
    
    
    _title = [[UILabel alloc] init];
    _title.text = @"请设置提醒时间";
    _title.backgroundColor = kWhiteColor;
    _title.textColor = kMainTextColor;
    _title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_title];
    
    _picker = [[UIDatePicker alloc] init];
    _picker.datePickerMode = UIDatePickerModeTime;
    _picker.backgroundColor = [UIColor flatBlackColor];
    [self addSubview:_picker];
    
    _done = [[UIButton alloc] init];
    [_done setBackgroundImage:kCommonButton_BG_Icon forState:UIControlStateNormal];
    [_done setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_done setTitle:@"完成" forState:UIControlStateNormal];
    [_done addTarget:self action:@selector(onDone) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_done];
    
    if (_isActionSheetStyle)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBackground:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
    }
    
    
    
}

- (void)onTapBackground:(UITapGestureRecognizer *)tap
{
    if (tap.state == UIGestureRecognizerStateEnded)
    {
        [self slideOut];
    }
}

- (void)configOwnViews
{
    NSDateFormatter *nowDateFormat = [[NSDateFormatter alloc] init];
    [nowDateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSString *now = [nowDateFormat stringFromDate:[NSDate date]];
    NSString *fromTimeStr = [NSString stringWithFormat:@"%@ %@", now, [AppSetting shareInstance].lunchTime];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    _picker.date = [dateFormat dateFromString:fromTimeStr];
}

- (void)relayoutFrameOfSubViews
{
    CGRect bounds = self.bounds;
    
    if (_isActionSheetStyle)
    {
        _fadeView.frame = bounds;
        
        [_done sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
        [_done alignParentBottom];
        
        [_picker sizeWith:CGSizeMake(bounds.size.width, 216)];
        [_picker layoutAbove:_done];
        
        [_title sameWith:_done];
        [_title layoutAbove:_picker];
    }
    else
    {
        [_title sizeWith:CGSizeMake(bounds.size.width, kBottomButtonHeight)];
        [_title alignParentTop];
        
        [_picker sizeWith:CGSizeMake(bounds.size.width, 216)];
        [_picker layoutBelow:_title];
        
        [_done sameWith:_title];
        [_done layoutBelow:_picker];
    }
    
    
}

- (void)slideIn
{
    [UIView animateWithDuration:0.3 animations:^{
        [self slideInFrom:kFTAnimationBottom duration:0.3 delegate:nil];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _fadeView.backgroundColor = kAppModalDimbackgroundColor;
        }];
    }];
}
- (void)slideOut
{
    [UIView animateWithDuration:0.1 animations:^{
        _fadeView.backgroundColor = kClearColor;
    } completion:^(BOOL finished) {
    
        [UIView animateWithDuration:0.3 animations:^{
            [self slideOutTo:kFTAnimationBottom duration:0.3 delegate:nil];
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }];
}

- (void)onDone
{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *str = [dateFormat stringFromDate:_picker.date];
    [AppSetting shareInstance].lunchTime = str;
    if (_doneAction)
    {
        _doneAction(self);
    }
    
    if (_isActionSheetStyle)
    {
        [self slideOut];
    }
}




@end
