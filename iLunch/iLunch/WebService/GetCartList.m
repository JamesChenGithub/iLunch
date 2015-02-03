//
//  GetCartList.m
//  iLunch
//
//  Created by James on 15-2-3.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "GetCartList.h"

@implementation GetCartListItem

@end

@implementation GetCartList

- (NSDictionary *)bodyDictionary
{
    NSDictionary *dic = @{@"UCode" : _UCode ? _UCode : @""};
    return dic;
}

- (Class)responseClass
{
    return [GetCartListResponse class];
}

- (void)parseArrayBody:(NSArray *)bodyDic
{
    GetCartListResponse *resp = (GetCartListResponse *)self.response;
    NSMutableArray *list = [NSObject loadItem:[GetCartListItem class] fromArrayDictionary:bodyDic];
    resp.cartList = list;
}

@end

@implementation GetCartListResponse


@end
