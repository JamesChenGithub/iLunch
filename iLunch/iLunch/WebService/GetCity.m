//
//  GetCity.m
//  iLunch
//
//  Created by James on 15-1-18.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetCity.h"

@implementation CityItem

- (NSString *)showName
{
    return self.CityName;
    
}

- (NSArray *)list
{
    return self.sections;
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


@end


@implementation CitySectionBuildingItem

- (NSString *)showName
{
    return self.Name;
    
}

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



