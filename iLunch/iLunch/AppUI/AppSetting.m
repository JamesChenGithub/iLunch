//
//  AppSetting.m
//  iLunch
//
//  Created by James on 15-1-8.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AppSetting.h"

@implementation AppSetting

#define kAppSetting_isAlertLunch    @"kAppSetting_isAlertLunch"
#define kAppSetting_LunchTime       @"kAppSetting_LunchTime"

static AppSetting *_shareInstance = nil;

+ (instancetype)shareInstance;
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _shareInstance = [[AppSetting alloc] init];
    });
    
    return _shareInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        
        // load isAlertLunch
        _isAlertLunch = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:kAppSetting_isAlertLunch] boolValue];
        
        _lunchTime = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kAppSetting_LunchTime];
        
    }
    return self;
}



- (void)setIsAlertLunch:(BOOL)isAlertLunch
{
    if (_isAlertLunch == isAlertLunch)
    {
        return;
    }
    
    _isAlertLunch = isAlertLunch;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:_isAlertLunch] forKey:kAppSetting_isAlertLunch];
}

- (void)setLunchTime:(NSString *)lunchTime
{
    if ([_lunchTime isEqualToString:lunchTime] && ![NSString isEmpty:lunchTime])
    {
        return;
    }
    
    _lunchTime = [lunchTime copy];
    [[NSUserDefaults standardUserDefaults] setObject:_lunchTime forKey:kAppSetting_LunchTime];
}

- (NSString *)lunchTime
{
    if (_isAlertLunch)
    {
        if ([NSString isEmpty:_lunchTime])
        {
            self.lunchTime = @"11:45";
        }
    }
    
    return _lunchTime;
}



@end
