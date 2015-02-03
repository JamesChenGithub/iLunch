//
//  GetShopData.m
//  iLunch
//
//  Created by James on 15-1-28.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetShopData.h"

@implementation GetShopDataItem


@end

@implementation GetShopData

- (Class)responseClass
{
    return [GetShopDataResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetShopDataResponse *resp = (GetShopDataResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetShopDataItem class] fromArrayDictionary:bodyDic];
    resp.shopDatas = list;
}


@end

@implementation GetShopDataResponse


@end
