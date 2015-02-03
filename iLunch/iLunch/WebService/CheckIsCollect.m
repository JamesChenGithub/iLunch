//
//  CheckIsCollect.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "CheckIsCollect.h"

@implementation CheckIsCollect

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{
                          @"FoodId" : @(_FoodId),
                          @"UserId" : @(_UserId),
                          };
    return dic;
}

- (Class)responseClass
{
    return [CheckIsCollectResponse class];
}

- (void)parseDictionaryBody:(NSDictionary *)bodyDic
{
    CheckIsCollectResponse *resp = (CheckIsCollectResponse *)self.response;
    resp.isCollected = [(NSNumber *)(bodyDic[@"bool"]) boolValue];
}


@end


@implementation CheckIsCollectResponse


@end