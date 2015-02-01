//
//  LunchTimeSettingView.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunchTimeSettingView : UIView
{
    UIView *_fadeView;
    UILabel *_title;
    UIDatePicker *_picker;
    UIButton *_done;
    
    BOOL _isActionSheetStyle;
}

- (instancetype)initActionSheetStyle;

@property (nonatomic, copy) CommonBlock doneAction;

- (void)slideIn;
- (void)slideOut;


@end
