//
//  GetCity.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetCity.h"

@implementation CityItem

- (instancetype)initWith:(CityItem *)item
{
    if (self = [super init])
    {
        self.CID = item.CID;
        self.CityName = item.CityName;
        self.Code = item.Code;
        self.Sort = item.Sort;
        self.IsShow = item.IsShow;
    }
    return self;
}

- (NSString *)showName
{
    return self.CityName;
    
}

- (NSArray *)list
{
    return self.sections;
}

- (NSMutableDictionary *)jsonDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                               @"CID" : @(_CID),
                                                                               @"CityName" : _CityName ? _CityName : @"",
                                                                               @"Code" : _Code ? _Code : @"",
                                                                               @"Sort" : @(_Sort),
                                                                               @"IsShow" : @(_IsShow),
                                                                               }];
    
    NSMutableArray *builds = [NSMutableArray array];
    for (CitySectionItem *item in _sections)
    {
        NSDictionary *dic = [item jsonDictionary];
        if (dic)
        {
            [builds addObject:dic];
        }
    }
    [dic addArray:builds forKey:@"sections"];
    
    return dic;
}

//- (NSString *)description
//{
//    NSMutableDictionary *dic = [self jsonDictionary];
//    
//    if ([NSJSONSerialization isValidJSONObject:dic])
//    {
//        return [NSString stringWithFormat:@"%@", dic];
//    }
//    
//    DebugLog(@" [ %@ convertToJSONString failde]", self.class);
//    return [super description];
//}

- (NSString *)getBuildingName
{
    if (self.sections.count)
    {
        CitySectionItem *sec = self.sections[0];
        
        if (sec.buildings.count)
        {
            CitySectionBuildingItem *item = sec.buildings[0];
            return [item showName];
        }
    }
    
    return nil;
}
@end

@implementation CitySectionItem

- (NSString *)showName
{
    return self.SectionName;
}

- (NSArray *)list
{
    return self.buildings;
}

- (NSMutableDictionary *)jsonDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                               @"Num" : @(_Num),
                                                                               @"pri" : @(_pri),
                                                                               @"SectionID" : @(_SectionID),
                                                                               @"Cid" : @(_Cid),
                                                                               @"SectionName" : _SectionName ? _SectionName : @""
                                                                               }];
    
    NSMutableArray *builds = [NSMutableArray array];
    for (CitySectionBuildingItem *item in _buildings)
    {
        NSDictionary *dic = [item jsonDictionary];
        if (dic)
        {
            [builds addObject:dic];
        }
    }
    [dic addArray:builds forKey:@"buildings"];
    
    return dic;
}

//- (NSString *)description
//{
//    NSMutableDictionary *dic = [self jsonDictionary];
//    
//    if ([NSJSONSerialization isValidJSONObject:dic])
//    {
//        return [NSString stringWithFormat:@"%@", dic];
//    }
//    
//    DebugLog(@" [ %@ convertToJSONString failde]", self.class);
//    return [super description];
//}

@end


@implementation CitySectionBuildingItem

- (NSString *)showName
{
    return self.Name;
    
}

- (NSMutableDictionary *)jsonDictionary
{
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithDictionary:@{
                                                                              @"DataID" : @(_DataID),
                                                                              @"Name" : _Name ? _Name : @"",
                                                                              @"Address" : _Address ? _Address : @"",
                                                                              @"Type" : @(_Type),
                                                                              @"Picture" : _Picture ? _Picture : @"",
                                                                              @"Remark" : _Remark ? _Remark : @"",
                                                                              @"SectionID" : @(_SectionID),
                                                                              @"FirstL" : _FirstL ? _FirstL : @"",
                                                                              @"SectionName" : _SectionName ? _SectionName : @"",
                                                                              @"Lat":_Lat ? _Lat : @"",
                                                                              @"Lng":_Lng ? _Lng : @"",
                                                                              @"isShow" : @(_isShow)
                                                                              }];
    return dic;
}

//- (NSString *)description
//{
//    NSMutableDictionary *dic = [self jsonDictionary];
//    
//    if ([NSJSONSerialization isValidJSONObject:dic])
//    {
//        return [NSString stringWithFormat:@"%@", dic];
//    }
//    
//    DebugLog(@" [ %@ convertToJSONString failde]", self.class);
//    return [super description];
//}


@end


@implementation GetCity

- (Class)responseClass
{
    return [GetCityResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetCityResponse *resp = (GetCityResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[CityItem class] fromArrayDictionary:bodyDic];
    resp.cityList = list;
}



@end

@implementation GetCityResponse


@end



@implementation GetSection

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"CID" : [NSString stringWithFormat:@"%ld", (long)_city.CID]
                          };
    return dic;
}


- (void)parseArrayBody:(NSArray *)bodyDic
{
    self.city.sections = [NSObject loadItem:[CitySectionItem class] fromArrayDictionary:bodyDic];
}

@end


@implementation GetBuilding

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"SID" : [NSString stringWithFormat:@"%ld", (long)_section.SectionID]
                          };
    return dic;
}


- (void)parseArrayBody:(NSArray *)bodyDic
{
    self.section.buildings = [NSObject loadItem:[CitySectionBuildingItem class] fromArrayDictionary:bodyDic];
}

@end



