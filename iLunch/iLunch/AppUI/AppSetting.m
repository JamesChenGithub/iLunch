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

#define kAppSetting_MyBuilding      @"kAppSetting_MyBuilding"

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
        [self loadLaunchSetting];
        
        // 加载位置
        
        [self loadMyBuilding];
        
        
    }
    return self;
}

#pragma mark - LunchSetting

- (void)loadLaunchSetting
{
    _isAlertLunch = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:kAppSetting_isAlertLunch] boolValue];
    
    _lunchTime = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kAppSetting_LunchTime];
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


#pragma mark - MyBuilding

- (void)saveMyBuilding
{
    NSDictionary *dic = [_myBuilding jsonDictionary];
    
    if ([NSJSONSerialization isValidJSONObject:dic])
    {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        if (!error)
        {
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            if (![NSString isEmpty:json])
            {
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kAppSetting_MyBuilding];
            }
            else
            {
                DebugLog(@"保存地址失败");
            }
        }
        else
        {
            DebugLog(@"保存地址失败");
        }
        
    }
    else
    {
        DebugLog(@"保存地址失败");
    }
}

- (void)setMyBuilding:(CityItem *)myBuilding
{
    if (_myBuilding == myBuilding)
    {
        return;
    }
    
    _myBuilding = myBuilding;
    
    [self saveMyBuilding];
}

- (void)loadMyBuilding
{
    NSString *json = [[NSUserDefaults standardUserDefaults] objectForKey:kAppSetting_MyBuilding];
    if (![NSString isEmpty:json])
    {
        NSDictionary *dic = [json objectFromJSONString];
        
        NSArray *sectionsArray = dic[@"sections"];
        
        NSMutableArray *secs = [NSMutableArray array];
        
        for (NSDictionary *secDic in sectionsArray)
        {
            
            CitySectionItem *item = [NSObject parse:[CitySectionItem class] dictionary:secDic];
            NSArray *buildsArray = secDic[@"buildings"];
            item.buildings = [NSObject loadItem:[CitySectionBuildingItem class] fromArrayDictionary:buildsArray];
            
            if (item)
            {
                [secs addObject:item];
            }
        }
        
        _myBuilding = [NSObject parse:[CityItem class] dictionary:dic itemClass:[CitySectionItem class]];
        _myBuilding.sections = secs;
    }
    
}


@end
