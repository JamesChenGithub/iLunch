//
//  AppSetting.h
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "Singleton.h"

@interface AppSetting : SingletonBase
{
    
    NSString *_lunchTime;
}

@property (nonatomic, assign) BOOL isAlertLunch;
@property (nonatomic, copy) NSString *lunchTime;

+ (instancetype)shareInstance;

@end
